ExceptionNotificationServer::Engine.routes.draw do
  resources :notifications, only: [:index]
end
