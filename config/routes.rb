Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root to: 'vehicles#show'
  get 'show', to: 'vehicles#show'
  #resources :vehicles
  scope module: 'api', path: "(:api)", api: /api/ , defaults: {format: 'json'} do
    namespace :v1 do
      #get '/gps', to: 'locations#index'
      post '/gps', to: 'locations#create'
    end
  end
end
