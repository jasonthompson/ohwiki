class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
      if user_params[:remember_me] == "1"
        remember_token = User.new_remember_token
        cookies.permanent[:remember_token]
        user.update_attribute(:remember_token)
      end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, :notice => "Logged out!"
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
