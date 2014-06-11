class AdminController < ApplicationController
  before_filter :authorize_admin

  private

  def authorize_admin
    if current_user.admin?
      authorize
    end
  end
end
