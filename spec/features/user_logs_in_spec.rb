require 'spec_helper'

feature 'Logging in' do
  before :each do
    User.new(:email => 'jason@example.ca', :password => 'secret').save
  end
  scenario 'Unauthenticated user logs in' do
    visit '/log_in'
    within('form#log_in') do
      fill_in 'email', :with => 'jason@example.ca'
      fill_in 'password', :with => 'secret'
    end
    click_button 'Log in'
    expect(page).to have_content 'Logged in!'
  end

  scenario 'Non users tries to log in' do
    visit '/log_in'
    within('form#log_in') do
      fill_in 'email', :with => 'zip@nonexistant.com'
      fill_in 'password', :with => 'zip'
    end
    click_button 'Log in'
    expect(page).to have_css('#log_in')
  end
end
