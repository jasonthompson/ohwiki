class AdminController < ApplicationController
  private

  def authorize_admin
    authorize
    unless current_user && current_user.admin?
      render :status => 403
    end
  end
end
