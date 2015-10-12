ExceptionNotificationServer.configure do |config|
  config.name, config.password, config.access_callback = 'webhook', '<%= SecureRandom.urlsafe_base64 %>', ->(controller){controller.current_user && controller.current_user.admin?}
end
