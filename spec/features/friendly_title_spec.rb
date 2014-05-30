require 'spec_helper'
require 'spec_helper_functions'
require 'uri'

feature 'title_url' do
  before :each do
    @page = Page.new(:title => "What do you think about this cafe?",
                     :body => "Some writing")
    @page.save
    User.new(:email => "jason@example.ca",
             :password => "secret",
             :password_confirmation => "secret").save
  end

  scenario 'user opens page using title_url' do
    log_in_user
    visit page_path @page
    expect(page).to have_content 'What do you think'
  end
end
