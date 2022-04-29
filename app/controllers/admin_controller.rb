class AdminController < ApplicationController
  include CurrentUserConcern



  def index
    #if @current_user.role == "admin"
      @users = User.all.select { |m| m.role == "freelancer" || m.role == "client" }
      render json: @users, methods: [:user_image_url] 
      #User.all.select { |m| m.role == "freelancer" || m.role == "client" }
    #else
      #render :json => 'you are not an admin'
    #end
  end
 
  def getallfreelancers
    @users = User.all.select { |m| m.role == "freelancer"  }
    render json: @users , methods: [:user_image_url]  , include: [ :languages , :freelancer_languages ]
  end
  
  def getmissiondata
    @mission = Mission.where(id: params[:id])
    render json: @mission , include: [:category , :client  , :mission_languages , :languages  ]
  end

  def getfreelancerdata
    @freelancer = Freelancer.where(id: params[:id])
    render json: @freelancer , methods: [:user_image_url]
  end
  
  def getfreelancersbyrating   
    @freelancer = User.where('role = ? ' , role = 0 ) .where("reviews_count >= ?" ,  params[:reviews_count])
    #@users = User.where('role = ? ' ,  role = "freelancer") 
    #@freelancers = User.where('role = ? ' , role = 0 ) 
    render json:  @freelancer , methods: [:user_image_url]
  end

  def getclientdata
    @client = Client.where(id: params[:id])
    render json: @client , methods: [:user_image_url]
  end
  def getmissionbyfreelancer
    @missions = Mission.where(freelancer_id: params[:freelancer_id])
    render json: @missions , include: [  :category , :mission_languages , :languages ]
  end
# 
# def getmissionbyclient
#    @clients =Client.where(role: "client")
#    @missions = @clients.includes(:missions).flat_map(&:missions)
 #    render json: {
   #    clients:  @clients,
   #    missions: @missions
# }
#   end

  def getclientmission
    @missions = Mission.where(client_id: params[:client_id])
    render json: @missions , include: [  :category , :mission_languages , :languages ]
  end

  def getfreelancermission
    @missions = Mission.where(freelancer_id: params[:freelancer_id])
    render json: {
      mission: @missions
    }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update(post_params)
      render json: @user , methods: [:user_image_url] 

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
  end
  def updatelanguage
    @user = User.find(params[:id])
        if @user.update(post_paramslanguage)  
           
            @freelancerLanguages =FreelancerLanguage.create!( language_id: params[:language_id], user_id: @user.id , languagerate: params[:languagerate])
            render json:  { 
               
              freelancerLanguages: @freelancerLanguages } , include: [ :language , :user]
        else
          render json: @user.errors, statut: :unprocessable_entity
        end
 
  end
  def getfreelancerlanguage
    @languagesfreelancer = FreelancerLanguage.where(user_id: params[:user_id])
    render json:
       @languagesfreelancer , include: [ :language , :user]
  end


  def updatefreelancerlanguages
    @freelancerLanguages  = FreelancerLanguage.find(params[:id])
    if @freelancerLanguages.update(post_paramsFreelancerLangueage)
      render json: @freelancerLanguages 

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
  end
    def getfreelancerbylanguage
    ids = []
        params[:language_id].split(',').each do |lang_id|
          ids.push(lang_id.to_i)
        end
        
        @freelancer_languagess = FreelancerLanguage.where(language_id: ids.uniq)
        
        @freelancers =  @freelancer_languagess.flat_map{|ml| ml.user }
        
        render json: @freelancers.uniq , include: [ :languages ]  , methods: [:user_image_url] 
      end
  def getfreelancerbylanguage2
    
    @languagess = FreelancerLanguage.where(language_id: params[:language_id])
    #@freelancer = User.where( id: @languagess.user_id)
    render json: @languagess 

  end


  def destroylanguagefreelancer
    @languagesfreelancer = FreelancerLanguage.find(params[:id])
    @languagesfreelancer.destroy
  end

  def updateFreelancer
    @user = User.find(params[:id])
    if @user.update(post_paramsFreelancer)
      render json: @user, methods: [:user_image_url] 

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
  end
  def updateclient
    @user = User.find(params[:id])
    if @user.update(post_params)
      render json: @user, methods: [:user_image_url] 

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  
  end
#############################################
  def destroyclient 
    @user = Client.find(params[:client_id])
    @user.destroy
  
  end
#############################################
  def countall
    @userscount = User.all.count
    @missioncount = Mission.all.count
    @categoriescount = Category.all.count
    @languagecount = Language.all.count
  
    render json: {
      data:[ @userscount,@missioncount,@categoriescount,@languagecount]

    }
    
  end

   def updateimagefreelancer
   
    @user = User.find(params[:id])
    if @user.update(paramsimagefreelancer)
      render json: @user, methods: [:user_image_url] 

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
  end
  def paramsimagefreelancer

    params.permit(:id, :avatar )
  end

  

  private
  
  def post_paramsFreelancerLangueage
    params.permit(:languagerate, :language_id )
  end

  def post_paramslanguage
    params.permit(:freelancer_languages =>[:languagerate] ,:freelancer_languages =>[ :user_id ], :freelancer_languages =>[:language_id] )
  end

  def post_params
    params.permit(:email ,:password , :adresse,:lastname,:firstname,:birthday,:sexe,:phone,:job,
      :description ,:github , :facebook,:instagram,:linkedin)
  end

  def post_paramsFreelancer
    params.permit(:id ,:password ,:earning ,:email , :adresse,:lastname,:firstname,:birthday,
      :sexe,:phone,:job,:description  ,:github , :facebook,:instagram,:linkedin)
  end

  def set_post
    @user = User.find(params[:id])
  end
end