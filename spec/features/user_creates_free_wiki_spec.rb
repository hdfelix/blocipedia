require 'spec_helper'

feature 'User manages a wiki' do

  scenario 'sees \'No wikis have been created\' if no wikis exist' do
    visit wikis_path
    expect(page).to have_content("No wikis have been created")
  end

  scenario 'create a new wiki' do
    @wiki = FactoryGirl.build(:wiki)
    visit wikis_path
    click_link "Create a Wiki"
    expect {
      fill_in 'Title',  with: @wiki.title
      fill_in 'Description',  with: @wiki.description
      #fill_in 'Category',  with: 'Personalities'
      click_button 'Create Wiki'
    }.to change(Wiki, :count).by(1)
    expect(page).to have_content('Wiki created successfully!')
  end
end
