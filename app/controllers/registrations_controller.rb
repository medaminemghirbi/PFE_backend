class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      firstname: params['user']['firstname'],
      lastname: params['user']['lastname'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      role: params['user']['role']
    )

    if user
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
