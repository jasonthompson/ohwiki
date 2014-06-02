class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "You are signed up!"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :password_confirmation)
  end
end
