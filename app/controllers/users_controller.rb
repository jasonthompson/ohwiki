class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to edit_user_path @user, :notice => "You are signed up!"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Your user information was successfully updated."
      redirect_to edit_user_path @user
    else
      render edit_user_path @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :password, :email, :password_confirmation)
  end
end
