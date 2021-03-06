Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :experiences

  get "log_in" => "sessions#new", as: "log_in"
  get "log_out" => "sessions#destroy", as: "log_out"

  get "/archived", to: 'experiences#archived'

  get "/random_user", to: 'users#random_user'

  delete "/unarchive", to: 'experiences#unarchive'

  root to: 'pages#home'
end
