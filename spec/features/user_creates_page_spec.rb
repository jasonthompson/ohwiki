require 'spec_helper'
require 'spec_helper_functions'

feature 'Creating a page' do
  before :each do
    User.new(:email => 'jason@example.ca', :password => 'secret').save
  end

  scenario 'Authenticated user creates page' do
    log_in_user
    click_link 'Add new page'
    fill_in 'page_title', :with => 'My New Page!'
    fill_in 'page_body', :with => 'Look, I\'m creating a new page.'
    click_button 'Create page'
     expect(page).to have_content 'My New Page!'
  end

  scenario 'Unauthenticated user tries to create page' do
    visit '/pages/new'
    expect(page).to have_content 'Please log in'
  end
end
