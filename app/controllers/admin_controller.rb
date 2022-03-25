class AdminController < ApplicationController
  include CurrentUserConcern
 
  def index
    if @current_user.role == "admin"
      @users = User.all
      render json: @users
    else 
      render :json => 'you are not an admin'
    end
  end

  def show
    if @current_user.role == "admin"
    @user = User.find(params[:id], current)
    render json: @user
  else
    render :json => 'you are not an admin'
  end
  end

  def update
    if @current_user.role == "admin"
    @user = User.find(params[:id])
    if @user.update(post_params)
      render json: @user

    else
      render json: @user.errors, statut: :unprocessable_entity
    end
  else
    render :json => 'you are not an admin'
  end
  end

  def destroy
    if @current_user.role == "admin"
    @user = User.find(params[:id])
    @user.destroy
  else
    render :json => 'you are not an admin'
  end
  end

  private

  def post_params
    params.require(:user).permit!
  end

  def set_post
    @user = User.find(params[:id])
  end
end
