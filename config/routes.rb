Rails.application.routes.draw do
  
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]

  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  get :freelancers, to: "admin#getallfreelancers"
  patch "/upadateFreelancer/:id", to: "admin#updateFreelancer"
  
  resources :admin, only: [:show, :create , :index, :update, :destroy]

  resources :missions, only: [:create, :index, :show , :update, :destroy]

  resources :categories, only: [:create, :index, :show , :update, :destroy]

  resources :missions, only: [:create, :index, :show , :update, :destroy]

  resources :reviews, only: [:create, :index, :show , :update, :destroy]

  resources :educations, only: [:create, :index, :show , :update, :destroy]

  resources :experiences, only: [:create, :index, :show , :update, :destroy]

  root to: "static#home"
end
