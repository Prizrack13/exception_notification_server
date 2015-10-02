Rails.application.routes.draw do
  mount ExceptionNotificationServer::Engine => '/exception_notification_server'
end
