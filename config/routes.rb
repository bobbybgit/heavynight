Rails.application.routes.draw do
  resources :wall_messages
  resources :event_settings
  resources :sessions
  resources :locations
  resources :games
  resources :venues
  resources :events
  resources :groups

  resources :groups do
    resources :memberships do
    end
  end

  
  devise_for :users, controllers: { 
  sessions: 'users/sessions',
  confirmations: 'users/confirmations',
  unlocks: 'users/unlocks',
  passwords: 'users/passwords',
  onmniauth_callbacks: 'users/omniauth_callbacks'
  }

  get "pages/dashboard", to: "pages#dashboard"

  root "pages#dashboard"

end
