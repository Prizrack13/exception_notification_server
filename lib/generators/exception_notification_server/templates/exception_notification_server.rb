ExceptionNotificationServer.configure do |config|
  config.name = 'webhook'
  config.password = '<%= SecureRandom.urlsafe_base64 %>'
  config.access_callback = ->(controller) { controller.current_user && controller.current_user.admin? }
end
