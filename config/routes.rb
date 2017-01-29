Rails.application.routes.draw do
  

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :robots, except: [:new]
  get '/index_customer' => 'robots#index_customer'
  resources :prototypes, only: [:show]
  resources :users, except: [:index]
  resources :manufacturers, only: [:show]
  get '/tina' => 'entrances#tina'
  get '/login_tina' => 'entrances#login_tina'
  get '/' => 'entrances#home'
  get '/home2' => 'entrances#home2'
end
