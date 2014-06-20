require 'spec_helper'
require 'spec_helper_functions'

feature 'Settings page' do
  before do
    @user = create_user
    @admin_user = create_admin_user
    @settings = Settings.new(:name => "My Wiki")
  end

  scenario 'regular user cannot open page' do
    log_in_user
    visit 'admin/settings'
    expect(page).to have_css('#recent-pages')
  end

  scenario 'admin user can open page' do
    log_in_admin_user
    visit 'admin/settings'
    expect(page).to have_css('#settings')
  end
end
