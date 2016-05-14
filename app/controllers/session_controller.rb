class SessionController < ApplicationController
  def new
  end

  def create
    user = User.where(:phone => params[:phone]).first
    if user.present?
      session[:user_id] = user.id
      session[:radius] = 5
      session[:category] = nil
      redirect_to root_path
    else
      newUser = User.new
      newUser.phone = params[:phone]
      if !newUser.save
        puts newUser.error
      end
      session[:user_id] = newUser.id
      session[:radius] = 5
      session[:category] = nil
      redirect_to user_path(newUser)
    end
  end

  def destroy
    session[:user_id] = nil
    session[:radius] = nil
    redirect_to root_path
  end
end
