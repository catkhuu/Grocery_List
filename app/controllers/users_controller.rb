class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :position, :password, :password_confirmation)
  end

end
