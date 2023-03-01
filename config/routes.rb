Rails.application.routes.draw do
  resources :wall_messages
  resources :event_settings
  resources :sessions
  resources :locations
  resources :venues
  resources :events
  resources :groups

  resources :games do
    collection do
      get 'add'
    end
  end

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

  get "groups/memberships/:id/remove_admin/", to: 'memberships#remove_admin', as: 'remove_admin'

  get "groups/memberships/:id/add_admin/", to: 'memberships#add_admin', as: 'add_admin'

  root "pages#dashboard"

end
