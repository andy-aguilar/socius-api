Rails.application.routes.draw do
  resources :friendships, only: [:create, :show, :update, :destroy]
  # resources :club_runs
  # resources :user_clubs
  # resources :clubs
  # resources :user_runs
  # resources :runs
  resources :users, only: [:create, :show, :update]
  resources :runs, only: [:index, :create]
  resources :user_runs, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/search/:query', to: 'users#search'
  get '/friendships/requests/:id', to: 'friendships#requests'
  get ''
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
