require 'spec_helper'

feature "Main page" do
  scenario "Unauthenticated user visits main page" do
    visit "/"
    expect(page).to have_css("#log_in")
  end

end
