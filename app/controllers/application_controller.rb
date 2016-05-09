class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user

  private
    def fetch_user
      @currentUser = User.find_by :id => session[:user_id] if session[:user_id].present?
      session[:user_id] = nil unless @currentUser.present?
    end

end
