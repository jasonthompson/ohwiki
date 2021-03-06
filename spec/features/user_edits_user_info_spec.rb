require 'spec_helper'
require 'spec_helper_functions'

feature 'Editable user info' do
  before do
    create_user
  end

  scenario 'Logged in user can edit his/her user info' do
    log_in_user
    click_on 'Jason Thompson'
    expect(page).to have_content('Jason Thompson')
    expect(page).to have_css('#user_form')
  end
end
