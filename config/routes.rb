Rails.application.routes.draw do
  resources :wall_messages
  resources :event_settings
  resources :sessions
  resources :locations
  resources :games
  resources :venues
  resources :events
  devise_for :users
  resources :groups


  # Defines the root path route ("/")
  root "groups#index"
end
