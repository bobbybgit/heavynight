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

   


    get '/calendars/increase/:date', to: 'calendar#increase', as: 'calendar_increase'
    get '/calendars/decrease/:date', to: 'calendar#decrease', as: 'calendar_decrease'
    get '/calendars/_calendar', to: 'calendars#new', as: 'calendar_new'
  

  
    get "pages/dashboard", to: "pages#dashboard"

  root "pages#dashboard"

end
