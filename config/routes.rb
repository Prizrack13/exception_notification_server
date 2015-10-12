ExceptionNotificationServer::Engine.routes.draw do
  resources :notifications, only: [:index, :create, :show, :update] do
    member do
      put :investigate
      put :fix
      put :renew
    end
  end
end
