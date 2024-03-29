Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:show, :index]
      resources :backgrounds, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trip, only: [:create]
      resources :munchies, only: [:index]
    end
  end
end