require 'spec_helper'
require 'spec_helper_functions'

feature 'Admin user' do
  before do
    @user = create_user
    @admin_user = create_admin_user
  end

  feature 'Admin checkbox' do
    scenario 'Admin user can see admin checkbox' do
      log_in_admin_user
      visit edit_user_path(@admin_user.id)
      expect(page).to have_css('input[name="user[admin]"]')
    end

    scenario 'Non-admin user does not see admin checkbox' do
      log_in_user
      visit edit_user_path(@user.id)
      expect(page).not_to have_css('input[name="user[admin]"]')
    end
  end

  feature 'Admin window' do
    scenario 'Admin user can open admin window' do
      log_in_admin_user
      visit admin_settings_path
      expect(page).to have_css('#settings')
    end
  end
end
