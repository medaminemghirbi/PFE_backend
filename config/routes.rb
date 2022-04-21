Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: %i[create confirm_email] do
    member do
      get :confirm_email
    end
  end
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'admin#logged_in'
  get :freelancers, to: 'admin#getallfreelancers'
  get 'client/:client_id', to: 'admin#getclientmission'
  get 'freelancer/:freelancer_id', to: 'admin#getfreelancermission'
  get 'freelancerdata/:id', to: 'admin#getfreelancerdata'
  patch 'updatecompleted/:id', to: 'requests#updatecompleted'


  get :countall, to: 'admin#countall'
  patch '/upadateFreelancer/:id', to: 'admin#updateFreelancer'
  patch '/updateclient/:id', to: 'admin#updateclient'
  patch '/updateimagefreelancer/:id', to: 'admin#updateimagefreelancer'
  patch '/updateadmin/:id', to: 'admin#update' 

  get 'getmissionbylanguage/:language_id', to: 'missions#getmissionbylanguage'
  get 'getmissionbycategory/:category_id', to: 'missions#getmissionbycategory'
  get 'getmissionbybudget/:budget', to: 'missions#getmissionbybudget'
  get 'getuserexperiance/:user_id', to: 'experiences#getuserexperiance'

  get 'getusereducation/:user_id', to: 'educations#getusereducation'
  get 'getrequestbyfreelancer/:freelancer_id', to: 'requests#getrequestbyfreelancer'
  get 'getrequestbyclient/:client_id', to: 'requests#getrequestbyclient'
  get 'getmissionbyfreelancer/:freelancer_id', to: 'admin#getmissionbyfreelancer'
  get 'activemission/:client_id', to: 'missions#getclientactivemission'
  get 'getendedmissionbyclient/:client_id', to: 'missions#getendedmissionbyclient'
  get 'getendedmissionbyfreelancer/:freelancer_id', to: 'missions#getendedmissionbyfreelancer'
  get 'countrequest/:mission_id', to: 'requests#countproposition'
  get 'getrequestacceptedbyclient/:client_id', to: 'requests#getrequestacceptedbyclient'
  get 'getrequestacceptedbyfreelancer/:freelancer_id', to: 'requests#getrequestacceptedbyfreelancer'
  resources :admin, only: %i[show create index update destroy]

  resources :missions, only: %i[create index show update destroy]

  resources :categories, only: %i[create index show update destroy]



  resources :reviews, only: %i[create index show update destroy]

  resources :educations, only: %i[create index show update destroy]

  resources :experiences, only: %i[create index show update destroy]
  
  resources :languages, only: %i[create index show update destroy]

  resources :requests , only: %i[create index show update destroy]
  root to: 'static#home'

end
