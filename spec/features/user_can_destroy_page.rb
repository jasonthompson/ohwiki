require 'spec_helper'
require 'spec_helper_functions'

feature 'Logged in user can destroy pages' do
  before do
    create_user
    @page = Page.new(:title => 'A crappy page', :body => 'Nothing.')
    @page.save
  end

  scenario 'An authenticated user can destroy a page' do
    log_in_user
    visit pages_path
    click_link 'Delete this page'
    expect(page).to have_content(%Q{ "#{@page.title}" was successfully deleted.})
  end
end
