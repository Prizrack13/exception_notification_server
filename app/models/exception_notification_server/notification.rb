module ExceptionNotificationServer
  class Notification < ActiveRecord::Base
    serialize :backtrace, Array
    serialize :data, Hash
    serialize :request, Hash
    serialize :session, Hash
    serialize :environment, Hash

    belongs_to :parent, class: ExceptionNotificationServer::Notification
    has_many :childrens, class: ExceptionNotificationServer::Notification, foreign_key: :parent_id

    scope :base_notifications, ->(status = nil) { status.present? ? where(parent: nil, status: status) : where(parent: nil) }
    STATUSES = [:new, :investigating, :fixed].freeze
    STATUSES.each do |status|
      scope "#{status}_notifications", -> { where(status: status) }
    end
    scope :application, ->(application = nil) { application.present? ? where(application: application) : all }
    scope :env, ->(env = nil) { env == 'all' ? all : where(env: env || Rails.env) }

    before_create do
      self.status = :new
      self.exception_hash = gen_exception_hash
      self.parent_id = Notification.where(exception_hash: exception_hash, status: [:new, :investigating]).first.try(:id)
    end

    def similar
      parent_id.nil? ? childrens : Notification.where(arel_table[:id].eq(parent_id).or(arel_table[:parent_id].eq(parent_id).and(arel_table[:id].eq(id).not)))
    end

    def similar_count(from = nil)
      return childrens.length + 1 if from.nil?
      childrens.count { |notification| notification.created_at >= from } + (created_at >= from ? 1 : 0)
    end

    def similar_count_sparkline(from = 1.month.ago.beginning_of_day)
      graph_data(from).values
    end

    def similar_count_flot(from = 3.month.ago.beginning_of_day)
      graph_data(from).to_a
    end

    def last_time
      [self, *childrens].sort_by(&:created_at).last.created_at
    end

    def update_recursive(updates)
      Notification.where(parent_id: base_id).update_all(updates) if base_id.present?
    end

    def update_recursive_all(updates)
      Notification.where(arel_table[:id].eq(base_id).or(arel_table[:parent_id].eq(base_id))).update_all(updates) if base_id.present?
    end

    # Those 4 fields can contain a lot of information (like 0.22mb), so we wanna decrease it by removing this info from children notification.
    # I think it is enough to have this info in base notification.
    def remove_data
      update_recursive(data: nil, request: nil, session: nil, environment: nil)
    end

    # We recover information from base notification. Better solution is just use base info but i wanna divide notifications.
    def recover_data
      base_notification = Notification.find(base_id)
      update_recursive(data: base_notification.data, request: base_notification.request, session: base_notification.session, environment: base_notification.environment)
    end

    def destroy_recursive
      Notification.where(arel_table[:id].eq(base_id).or(arel_table[:parent_id].eq(base_id))).delete_all if base_id.present?
    end

    protected

    def graph_data(from)
      result = from.to_datetime.step(Time.zone.now.to_datetime, 1).map { |time| [time.beginning_of_day.to_i * 1000, 0] }.to_h
      childrens.each { |notification| result[notification.created_at.beginning_of_day.to_i * 1000] += 1 if notification.created_at >= from }
      result[created_at.beginning_of_day.to_i * 1000] += 1 if created_at >= from
      result
    end

    def arel_table
      self.class.arel_table
    end

    def gen_exception_hash
      Digest::SHA1.hexdigest("#{application}#{exception_class}#{exception_message}#{backtrace.to_s.gsub(rails_root, '')}")
    end

    def base_id
      parent_id || id
    end
  end
end
