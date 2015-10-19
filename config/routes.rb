ExceptionNotificationServer::Engine.routes.draw do
  resources :notifications, only: [:index, :create, :show, :update, :destroy] do
    member do
      put :investigate
      put :fix
      put :renew
    end
    collection do
      put :investigate
      put :fix
      put :renew
      delete :destroy
    end
  end
  root to: 'notifications#index'
end
