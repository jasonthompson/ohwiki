require 'spec_helper'
require 'uri'

feature 'title_url' do
  before :each do
    @page = Page.new(:title => "What do you think about this cafe?",
                     :body => "Some writing")
    @page.save
    User.new(:email => "user@example.com",
             :password => "secret",
             :password_confirmation => "secret").save
  end

  scenario 'user opens page using title_url' do
    visit '/log_in'
    within('form#log_in') do
      fill_in 'email', :with => 'user@example.com'
      fill_in 'password', :with => 'secret'
      click_on 'Log in'
    end
    visit page_path @page
    expect(page).to have_content 'What do you think'
  end
end
