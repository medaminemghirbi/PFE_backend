class RegistrationsController < ApplicationController

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_confirmed = true
      user.confirm_token = nil
      user.save
      render json:  "Account Acctivated" 

      #flash[:success] = "Welcome to the Sample App! Your email has been confirmed.Please sign in to continue."
      #redirect_to signin_url
    else
      #flash[:error] = "Sorry. User does not exist"
      # redirect_to root_url
      render json: { status: 500 }

    end

  end


  def create
    user = User.create!(
      firstname: params['firstname'],
      lastname: params['lastname'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation'],
      role: params['role'].to_i
    )

    if user
      UserMailer.registration_confirmation(user).deliver
      #flash[:success] = "Please confirm your email address to continue"
      
      session[:user_id] = user.id

      render json: {
        status: :created,

        user: user
      }
    else
      render json: { status: 500 }
    end
  end
end
