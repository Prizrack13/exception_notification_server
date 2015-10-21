namespace :exception_notification_server do
  desc 'Regenerate notification HASH'
  task regenerate_hash: :environment do
    notifications = ExceptionNotificationServer::Notification.order(:id).all
    exception_hashes = {}
    notifications.each do|notification|
      exception_hash = notification.send(:gen_exception_hash)
      exception_hashes[exception_hash] ||= []
      exception_hashes[exception_hash] << notification.id
    end
    base_notifications = ExceptionNotificationServer::Notification.where(id: exception_hashes.values.map(&:first))
    exception_hashes.each do |exception_hash, ids|
      base_notification = base_notifications.find { |notification| notification.id == ids.first }
      ExceptionNotificationServer::Notification.where(id: ids).update_all(exception_hash: exception_hash, parent_id: base_notification.id, status: base_notification.status)
      base_notification.remove_data if base_notification.status == 'fixed'
    end
    base_notifications.update_all(parent_id: nil)
  end
end
