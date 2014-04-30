require 'spec_helper'

feature "Logging in" do
  scenario "Unauthenticated user logs in" do
    visit "/login"
    within("#login") do
      fill_in "Username", :with => 'user@example.com'
      fill_in "Password", :with => 'secret'
    end
    click_link 'Log in'
    expect(page).to have_content 'Success'
  end
end
