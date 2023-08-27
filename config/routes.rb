Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # /api/v1/items/1/reservations
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :item_details
      end
    end
      resources :users do 
        resources :reservations
      end
      resources :items, only: [:index, :show, :create, :update, :destroy] do 
        resources :reservations
      end
    end
  end
end
