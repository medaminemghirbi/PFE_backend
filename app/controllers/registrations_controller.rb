class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      firstname: params['user']['firstname'],
      lastname: params['user']['lastname'],
      email: params['user']['email'],
      adresse: params['user']['adresse'],
      birthday: params['user']['birthday'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      sexe: params['user']['sexe'],
      rating: params['user']['rating'],
      job: params['user']['job'],
      description: params['user']['description'],
      photo: params['user']['photo'],
      phone: params['user']['phone'],
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
