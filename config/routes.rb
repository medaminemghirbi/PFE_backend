Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :admin, only: [:index]
end
