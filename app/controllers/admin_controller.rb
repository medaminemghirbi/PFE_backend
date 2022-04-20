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
    render json: @users , methods: [:user_image_url] 
  end
  
  def getfreelancerdata
    @user = User.find(params[:id])
    render json: @user, methods: [:user_image_url],  include: [:education, :experience]
    
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
      render json: @user

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
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

  def countall
    @userscount = User.all.count
    @missioncount = Mission.all.count
    @categoriescount = Category.all.count
    @languagecount = Language.all.count
    render json: {
      userscount: @userscount,
      missioncount: @missioncount,
      categoriescount: @categoriescount,
      languagecount: @languagecount

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

  def post_params
    params.permit(:email , :password , :adresse,:lastname,:firstname,:birthday,:sexe,:phone,:job,:description,:avatar)
  end

  def post_paramsFreelancer
    params.permit(:id ,:earning ,:email , :password , :adresse,:lastname,:firstname,:birthday,:sexe,:phone,:job,:description,:avatar )
  end



  def set_post
    @user = User.find(params[:id])
  end
end