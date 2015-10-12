class CreateExceptionNotificationServerNotifications < ActiveRecord::Migration
  def up
    create_table :exception_notification_server_notifications do |t|
      t.integer :parent_id
      t.string :status
      t.string :exception_hash
      t.string :env
      t.string :application
      t.string :server
      t.string :process
      t.string :rails_root
      t.string :exception_class
      t.string :exception_message
      t.binary :backtrace
      t.binary :data
      t.binary :request
      t.binary :session
      t.binary :environment
      t.timestamps
    end
  end

  def down
    drop_table :exception_notification_server_notifications
  end
end
