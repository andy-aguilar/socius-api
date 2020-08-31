Rails.application.routes.draw do
  # resources :club_runs
  # resources :user_clubs
  # resources :clubs
  # resources :user_runs
  # resources :runs
  resources :users, only: [:create]
  resources :runs, only: [:index, :create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
