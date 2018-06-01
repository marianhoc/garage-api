class SessionsController < ApplicationController

  def create
    user = User.where(email: params[:email]).first

    puts " = = = = = = = = = = = = USER = = = == = = = = = = = == = "
    puts user

    if user && user.valid_password?(params[:password])
      render json: user, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    user = User.find_by(authentication_token: params[:authentication_token])
    user.update_attribute(:authentication_token, nil) if user
  end


end
