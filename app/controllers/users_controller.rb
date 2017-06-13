class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :find_and_ensure_user, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    binding.pry
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @user = User.new
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :position, :password, :password_confirmation)
  end

  def find_and_ensure_user
    render 'application/error404' unless @user = User.find_by(id: session[:user_id])
  end
end
