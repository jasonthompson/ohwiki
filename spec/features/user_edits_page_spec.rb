require 'spec_helper'
require 'spec_helper_functions'

feature 'Editing a page' do
  before :each do
    User.new(:email => 'jason@example.ca', :password => 'secret').save
    @page = Page.new(:title => "A New Page", :body => "This is my new page.")
    @page.save
  end

  scenario 'Authenticated user edits page' do
    log_in_user
    visit page_path @page
    click_link 'Edit this page'
    click_on 'Save changes'
    expect(page).to have_content ('A New Page')
  end

  # scenario 'Unauthenticated user tries to create page' do
  #   visit '/pages/new'
  #   expect(page).to have_content 'Please log in'
  # end
end
