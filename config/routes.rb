Rails.application.routes.draw do
  resources :club_runs
  resources :user_clubs
  resources :clubs
  resources :user_runs
  resources :runs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
