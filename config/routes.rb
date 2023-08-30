require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  mount Sidekiq::Web => '/sidekiq'
  root "home#index"

  namespace :api do
    namespace :v1 do
      resources :restaurants
      resources :devices
    end
  end

end
