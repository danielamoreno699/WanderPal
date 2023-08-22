Rails.application.routes.draw do
  # /api/v1/items/1/reservations
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy]
      resources :users do 
        resources :reservations
      end
      resources :items, only: [:index, :show, :create, :update, :destroy] do 
        resources :reservations
      end
    end
  end
end
