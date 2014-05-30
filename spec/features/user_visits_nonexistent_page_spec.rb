require 'spec_helper'

feature 'non-existent page is editable' do
  scenario 'user visits non-existent page' do
    visit '/kittykaz'
    expect(page).to have_content('This page does not exist yet.')
  end
end
