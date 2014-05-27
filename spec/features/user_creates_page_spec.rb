require 'spec_helper'

feature 'Creating a page' do
  before :each do
    User.new(:email => 'jason@example.ca', :password => 'secret').save
  end

  scenario 'Authenticated user creates page' do
    visit '/log_in'
    within('form#log_in') do
      fill_in 'email', :with => 'jason@example.ca'
      fill_in 'password', :with => 'secret'
    end
    click_on 'Log in'
    click_link 'Create page'
    fill_in 'page_title', :with => 'My New Page!'
    fill_in 'page_body', :with => 'Look, I\'m creating a new page.'
    click_on 'Create page'
    expect(page).to have_content 'My New Page!'
  end
end
