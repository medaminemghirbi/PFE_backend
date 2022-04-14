Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: %i[create confirm_email] do
    member do
      get :confirm_email
    end
  end
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  get :freelancers, to: 'admin#getallfreelancers'
  get 'client/:client_id', to: 'admin#getclientmission'
  get 'freelancer/:freelancer_id', to: 'admin#getfreelancermission'
  get 'freelancerdata/:id', to: 'admin#getfreelancerdata'
  get :countall, to: 'admin#countall'
  patch '/upadateFreelancer/:id', to: 'admin#updateFreelancer'
  patch '/updateclient/:id', to: 'admin#updateclient'
  patch '/updateimagefreelancer/:id', to: 'admin#updateimagefreelancer'
  patch '/updateadmin/:id', to: 'admin#update'
  

  get 'getuserexperience/:freelancer_id', to: 'experiences#getuserexperiance'

  get 'getusereducation/:freelancer_id', to: 'educations#getusereducation'
  
  get 'getmissionbyfreelancer/:freelancer_id', to: 'admin#getmissionbyfreelancer'

  resources :admin, only: %i[show create index update destroy]

  resources :missions, only: %i[create index show update destroy]

  resources :categories, only: %i[create index show update destroy]

  resources :missions, only: %i[create index show update destroy]

  resources :reviews, only: %i[create index show update destroy]

  resources :educations, only: %i[create index show update destroy]

  resources :experiences, only: %i[create index show update destroy]
  
  resources :languages, only: %i[create index show update destroy]

  root to: 'static#home'

end