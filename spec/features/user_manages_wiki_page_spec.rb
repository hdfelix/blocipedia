require 'spec_helper'
require 'Faker'

feature 'User creates a wiki page' do
	scenario ' on a free wiki successfully.' do
		@wiki = FactoryGirl.create(:wiki)
		visit wiki_pages_path
		save_and_open_page
		click_link @wiki.title
		click_link 'Add Page'
		fill_in 'title', with: 'Test page'
		fill_in 'body', with: Faker::Lorem.paragraph
	end
end
