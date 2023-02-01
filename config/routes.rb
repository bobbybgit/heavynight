Rails.application.routes.draw do
  resources :groups
  

  # Defines the root path route ("/")
  root "groups#index"
end
