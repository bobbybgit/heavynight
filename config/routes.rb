Rails.application.routes.draw do
  resources :wall_messages
  resources :event_settings
  resources :sessions
  resources :locations
  resources :games
  resources :venues
  resources :events
  resources :groups
  devise_for :users

  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  resources :groups do
    resources :memberships do
    end
  end

  get '/calendars/_calendar', to: 'calendars#new', as: 'calendar_new'
   
  get "pages/dashboard", to: "pages#dashboard"

  get "groups/memberships/remove_admin/:id", to: 'memberships#remove_admin', as: 'remove_admin'

  get "groups/memberships/add_admin/:id", to: 'memberships#add_admin', as: 'add_admin'

  root "pages#dashboard"

end
