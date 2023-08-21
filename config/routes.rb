Rails.application.routes.draw do
  # /api/v1/items/1/reservations
  namespace :api do
    namespace :v1 do
      resources :reservations
      resources :users do 
        resources :reservations
      end
      resources :items do 
        resources :reservations
      end
    end
  end
end
