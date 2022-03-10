class AdminController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
  def show
    render json: @user
  end
  def update 
    if @user.update(post_params)
        render json: @user 
   
    else
        render json: @user.errors, statut: :unprocessable_entity
    end    
end
def destroy 
    @user.destroy
end

private 

def set_post 
    @user = User.find(params[:id])
end  

def post_params 
    params.require(:user).permit!
end
end


