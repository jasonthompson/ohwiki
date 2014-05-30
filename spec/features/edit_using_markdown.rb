require 'spec_helper'
require 'spec_helper_functions'

feature 'edit with markdown' do
  before do
    @content = \
      <<-eos
        Here's the first line [and it has a link!](/pages/new_page).

        ## It has subheaders
        It also has mulitple paragraphs as well as the following:
        - Bullet list
        - With two items

        That was great.
        eos

    create_user
  end

  scenario 'user edits page with markdown' do
    log_in_user
    visit new_page_path
    fill_in 'page_title', :with => 'My New Page!'
    fill_in 'page_body', :with => @content
    click_button 'Create page'
    expect(page).to have_content 'It has subheaders'
    expect(page).to have_selector 'h2'
    expect(page).to have_selector 'ul li'
  end
end
