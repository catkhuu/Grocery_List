class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def current_user
    @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user!
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
