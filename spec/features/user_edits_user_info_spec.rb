require 'spec_helper'
require 'spec_helper_functions'

feature 'Editable user info' do
  before do
    create_user
  end

  scenario 'Logged in user can edit his/her user info' do
    user = log_in_user
    click_link('Edit profile')
    expect(page).to have_css('#user_form')
  end
end
