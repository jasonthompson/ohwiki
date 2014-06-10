require 'spec_helper'
require 'spec_helper_functions'

feature 'Admin user' do
  before do
    @user = create_user
    @admin_user = create_admin_user
  end

  feature 'Admin user can create other admin users' do
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
end
