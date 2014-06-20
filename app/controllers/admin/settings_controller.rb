class Admin::SettingsController < AdminController
  def show
    @settings = Settings.first
  end

  def edit
    @settings = Settings.first
  end

  def destroy
    @settings = Settings.first
    @settings.destroy
    # Do you really want to break everything?
  end
end
