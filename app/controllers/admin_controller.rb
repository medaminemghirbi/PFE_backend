class AdminController < ApplicationController
  include CurrentUserConcern

  def index
    #if @current_user.role == "admin"
      @users = User.all
      render json: @users 
    #else
      #render :json => 'you are not an admin'
    #end
  end

  def show
  
    @user = User.find(params[:id], current)
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
      render json: @user

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
 
  end

  def destroy
    
    @user = User.find(params[:id])
    @user.destroy
  
  end

  private

  def post_params
    params.permit(:email , :password , :adresse,:lastname,:firstname,:birthday,:sexe,:rating,:phone,:job,:description,:photo)
  end

  def post_paramsFreelancer
    params.permit(:earning ,:email , :password , :adresse,:lastname,:firstname,:birthday,:sexe,:rating,:phone,:job,:description,:photo )
  end

  def set_post
    @user = User.find(params[:id])
  end
end
