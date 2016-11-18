Rails.application.routes.draw do
  resources :images
  resources :users
  resources :sessions

  get "log_in" => "sessions#new", as: "log_in"
  get "log_out" => "sessions#destroy", as: "log_out"

  root to: 'pages#home'
end
