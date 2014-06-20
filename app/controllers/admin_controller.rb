class AdminController < ApplicationController
  before_filter :authorize_admin

  private

  def authorize_admin
    unless current_user.admin?
      redirect_to pages_path, :alert => "You are not permitted to do that."
    end
  end
end
