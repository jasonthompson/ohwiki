class Admin::SettingsController < AdminController
  before_filter :authorize_admin

  def index
    @settings = Settings.first
    render :show
  end

  def show
  end
end
