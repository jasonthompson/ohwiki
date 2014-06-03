require 'spec_helper'
require 'spec_helper_functions'

feature 'Remember me at next login' do
  before do
    create_user
  end

  scenario 'User can check "Remember me" to stay logged in' do
    visit log_in_path
    expect(page).to have_css('input#remember_me')
  end

  # scenario "Session is persisted when user checks 'Remember me'" do
  #   visit log_in_path
  #   fill_in(:email, :with => 'jason@jthompson.ca')
  #   fill_in(:password, :with => 'secret')
  #   check('Remember me')
  # end
end
