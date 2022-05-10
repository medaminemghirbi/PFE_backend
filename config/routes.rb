Rails.application.routes.draw do

  
  root to: 'users#index'

  get 'countAllHome' , to: 'admin#countAllHome'

  resources :messages 


  get 'password_resets/new'
  resources :password_resets
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

  get 'clientdata/:id', to: 'admin#getclientdata' 
  get 'freelancerdata/:id', to: 'admin#getfreelancerdata' 
  get 'missiondata/:id', to: 'admin#getmissiondata' 

  get 'freelancersbyrating/:reviews_count', to: 'admin#getfreelancersbyrating'

  get :countall, to: 'admin#countall'

  patch '/updateFreelancer/:id', to: 'admin#updateFreelancer'
  patch '/updateclient/:id', to: 'admin#updateclient'
  patch '/updateimagefreelancer/:id', to: 'admin#updateimagefreelancer'
  patch '/updateadmin/:id', to: 'admin#update'
  
  
  patch '/updatelanguage/:id', to: 'admin#updatelanguage'
  get '/getfreelancerlanguage/:user_id', to: 'admin#getfreelancerlanguage'
  
  delete 'destroylanguagefreelancer/:id', to: 'admin#destroylanguagefreelancer'
  patch '/updatefreelancerlanguages/:id', to: 'admin#updatefreelancerlanguages'

  get 'countrequest/:mission_id', to: 'requests#countproposition'

  get 'ratingfreelancer/:user_id', to: 'reviews#ratingfreelancer'
  get 'ratingclient/:user_id', to: 'reviews#ratingclient'

  get 'getrequestacceptedbyclient/:client_id', to: 'requests#getrequestacceptedbyclient'
  get 'getendedmissionbyclient/:client_id', to: 'missions#getendedmissionbyclient'
  

  patch 'updatecompleted/:id', to: 'requests#updatecompleted'
  delete 'deleterequestbyfreelancer/:id', to: 'requests#deleterequestbyfreelancer'

  get 'getrequestacceptedbyfreelancer/:freelancer_id', to: 'requests#getrequestacceptedbyfreelancer'
  get 'getendedmissionbyfreelancer/:freelancer_id', to: 'missions#getendedmissionbyfreelancer'

  get 'getrequestbyfreelancer/:freelancer_id', to: 'requests#getrequestbyfreelancer'
  get 'getrequestbyclient/:client_id', to: 'requests#getrequestbyclient'

  get 'getmissionbylanguage/:language_id', to: 'missions#getmissionbylanguage'
  get 'getmissionbycategory/:category_id', to: 'missions#getmissionbycategory'
  get 'getmissionbybudget/:budget', to: 'missions#getmissionbybudget'
  
  get 'getfreelancerbylanguage/:language_id', to: 'admin#getfreelancerbylanguage'

  get 'getuserexperiance/:user_id', to: 'experiences#getuserexperiance'

  get 'getusereducation/:user_id', to: 'educations#getusereducation'
  
  get 'getmissionbyfreelancer/:freelancer_id', to: 'admin#getmissionbyfreelancer'

  delete 'admin/:id', to: 'admin#destroy'

  delete 'deleteclient/:client_id', to: 'admin#destroyclient'

  resources :admin, only: %i[show create index update destroy ]

  resources :missions, only: %i[create index show update destroy]

  resources :categories, only: %i[create index show update destroy]

  resources :missions, only: %i[create index show update destroy]

  resources :reviews, only: %i[create index show update destroy]

  resources :educations, only: %i[create index show update destroy]

  resources :experiences, only: %i[create index show update destroy]
  
  resources :languages, only: %i[create index show update destroy]

  resources :requests , only: %i[create index show update destroy]

  resources :favoris , only: %i[ create index destroy ]
  get 'favoris/:user_id', to: 'favoris#show'

  #root to: 'static#home'

end