Rails.application.routes.draw do
  resources :images, only: [:index]
  root to: 'pages#home'
end
