Rails.application.routes.draw do
  devise_for :users
  resources :groups
  

  # Defines the root path route ("/")
  root "groups#index"
end
