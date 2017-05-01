Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  match '/users/destroy', :to => "users#destroy", via: [:get, :post]
  resources :users

  root 'events#index'

  match '/events/search', :to => "events#search", via: [:get, :post]

  resources :events do
    resources :event_members
    resources :users
  end

  resources :invites, only: [:new, :create]

  match '/event_members/destroy', :to => "event_members#destroy", via: [:delete]
  match '/event_members/create', :to => "event_members#create", via: [:get, :post]
  resources :event_members

end
