Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :robots
  resources :prototypes, only: [:show]
  resources :users, only: [:show]
  resources :manufacturers, only: [:show]
  get '/tina' => 'entrances#tina'
  get '/login_tina' => 'entrances#login_tina'
  get '/' => 'entrances#home'
  get '/home2' => 'entrances#home2'
end
