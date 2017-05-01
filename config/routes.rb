Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  match '/users/destroy', :to => "users#destroy", via: [:get, :post]
  resources :users

  root 'home#show'

  match '/locations/create', :to => "locations#create", via: [:get, :post]

  match '/datetimes/create', :to => "datetimes#create", via: [:get, :post]

  # match '/events/search', :to => "events#search", via: [:get, :post]
  resources :events do
    resources :locations
    resources :datetimes
  end

  resources :invites, only: [:new, :create]

  match '/event_members/destroy', :to => "event_members#destroy", via: [:delete]
  match '/event_members/create', :to => "event_members#create", via: [:get, :post]
  resources :event_members

end
