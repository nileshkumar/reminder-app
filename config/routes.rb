require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :tickets
  resources :users
  
  root "tickets#index"
end
