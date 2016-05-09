class SessionController < ApplicationController
  def new
  end

  def create
    puts params.inspect
    user = User.where(:phone => params[:phone]).first
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path
    else
      newUser = User.new
      newUser.phone = params[:phone]
      if !newUser.save
        puts newUser.error
      end
      session[:user_id] = newUser.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
