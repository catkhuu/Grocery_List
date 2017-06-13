class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = ['Invalid email or password']
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
