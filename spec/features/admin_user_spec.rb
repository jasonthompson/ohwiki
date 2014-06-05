require 'spec_helper'
require 'spec_helper_functions'

feature 'Admin user' do
  before do
    @user = create_user
  end

  scenario 'There is an admin user' do
    log_in_user
    visit edit_user_path(@user.id)
    expect(page).to have_css('input[name="user[admin]"]')
  end
end
