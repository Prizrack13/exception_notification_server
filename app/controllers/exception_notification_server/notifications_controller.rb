module ExceptionNotificationServer
  class NotificationsController < ExceptionNotificationServer::ApplicationController
    http_basic_authenticate_with name: ExceptionNotificationServer.configuration.name,
                                 password: ExceptionNotificationServer.configuration.password, only: :create
    respond_to :html, :json, :js

    before_filter :load_notification, only: [:show, :update]
    skip_before_filter :redirect_to_root, only: [:create]

    def index
      params[:env] ||= 'all'
      params[:status] ||= :new
      @notifications = Notification.base_notifications(params[:status])
                       .application(params[:application])
                       .env(params[:env])
                       .includes(:childrens)
                       .joins('LEFT JOIN "exception_notification_server_notifications" "ensn" on "ensn"."parent_id" = "exception_notification_server_notifications"."id"')
                       .group('"exception_notification_server_notifications"."id"')
                       .order('count(ensn.id) DESC')
                       .paginate(page: params[:page], per_page: 10)
      respond_with @notifications
    end

    def create
      @notification = Notification.create(notification_params)
      respond_with @notification
    rescue
      render nothing: true
    end

    def show
      require 'coderay'
      @similar = @notification.similar.paginate(page: params[:page], per_page: 10)
      respond_with @notification
    end

    def update
      update_notification(@notification, notification_params_update, params[:recursive])
      respond_with @notification
    end

    def investigate
      notifications_actions { |notification| update_notification(notification, { status: :investigating }, true) }
    end

    def fix
      notifications_actions { |notification| update_notification(notification, { status: :fixed }, true) }
    end

    def renew
      notifications_actions { |notification| update_notification(notification, { status: :new }, true) }
    end

    def destroy
      notifications_actions(&:destroy_recursive)
    end

    protected

    def load_notification
      @notification = Notification.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Can't find notification with id #{params[:id]}."
      respond_to do |format|
        format.js { render js: "window.location = '#{notifications_url}';" }
        format.html { redirect_to notifications_path }
      end
    end

    def notification_params
      {
        application: params[:application],
        env: params[:env],
        status: params[:status],
        server: params[:server],
        process: params[:process],
        rails_root: params[:rails_root],
        exception_class: params[:exception][:error_class],
        exception_message: params[:exception][:message],
        backtrace: params[:exception][:backtrace],
        data: params[:data],
        request: params[:request],
        session: params[:session],
        environment: params[:environment]
      }.delete_if { |_, value| value.blank? }
    end

    def notification_params_update
      params.require(:notification).permit!
    end

    def update_notification(notification, notification_params = notification_params_update, recursive = true)
      notification.send("update#{'_recursive_all' if recursive}", notification_params)
      notification.remove_data if recursive && notification_params[:status] == :fixed
    end

    def notifications_actions(&block)
      notications = Notification.where(id: params[:ids] || params[:id])
      notications.each(&block)
      params[:id] && notications.first ? respond_with(notications.first) : respond_with({}, location: root_path)
    end
  end
end
