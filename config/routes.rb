Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#new' 


end
