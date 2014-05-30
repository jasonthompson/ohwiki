require 'spec_helper'
require 'spec_helper_functions'

feature 'non-existent page is editable' do
  before do
    create_user
  end

  scenario 'user visits non-existent page' do
    log_in_user
    visit 'pages/kittykaz'
    expect(page).to have_css '.create-non-existent'
  end
end
