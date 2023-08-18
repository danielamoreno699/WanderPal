Rails.application.routes.draw do
  # /api/v1/greetings
  namespace :api do
    namespace :v1 do
      resources :reservations
      resources :items
      resources :users
    end
  end
end
