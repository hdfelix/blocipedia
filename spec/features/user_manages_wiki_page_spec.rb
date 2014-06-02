require 'spec_helper'
require 'Faker'

feature 'User creates a wiki page' do
  scenario ' on a free wiki successfully.' do
    @wiki = FactoryGirl.create(:wiki)
    visit wiki_path(@wiki)
    click_link 'New Page'
    expect {
    fill_in 'page_title', with: 'Test page'
    fill_in 'page_body', with: Faker::Lorem.paragraph
    click_button'Save'
    }.to change(@wiki.pages, :count).by(1)
  end
end
