Rails.application.routes.draw do

  get "groups/table", to: "groups#table", as: 'groups_table'
  get "groups/_filter", to: "groups#filter", as: 'filter'
  get "games/_games_filter", to: "games#filter", as: 'games_filter'
  get "games/table", to: "games#table", as: 'games_table'
  get "pages/_loading", to: "pages#loading", as: "loading"
  get "games/results", to: "games#results", as: "games_results"
  get "groups/results", to: "groups#results", as: "groups_results"
  get "events/results", to: "events#results", as: "events_results"
  get "events/table", to: "events#table", as: 'events_table'
  get "events/_filter", to: "events#filter", as: 'events_filter'

  
  resources :wall_messages
  resources :event_settings
  resources :sessions
  resources :locations
  resources :venues
  resources :events
  resources :groups

  resources :games do
    collection do
      get 'confirm'
      get 'add'
      get 'multi_add'
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

  

  get '/calendars/calendar', to: 'calendars#calendar', as: 'calendar_new'
   
  get "pages/dashboard", to: "pages#dashboard"

  get "pages/dash_groups", to: "pages#dash_groups", as: "dash_groups"

  get "pages/dash_games", to: "pages#dash_games", as: "dash_games"

  get "pages/dash_events", to: "pages#dash_events", as: "dash_events"

  get "groups/memberships/:id/remove_admin", to: 'memberships#remove_admin', as: 'remove_admin'

  get "groups/memberships/:id/add_admin", to: 'memberships#add_admin', as: 'add_admin'

  root "pages#dashboard"

end
