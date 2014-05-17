require 'spec_helper'

feature 'User manages a wiki' do
	scenario 'create a new wiki' do
		visit wikis_path
		click_link "New Wiki"

		within 'form#new_wiki' do
			expect {
				fill_in 'Title',  with: 'My Wiki'
				fill_in 'Description',  with: 'All about me'
				#fill_in 'Category',  with: 'Personalities'
				click_button 'Create'
			}.to change(Wiki, :count).by(1)
		end
		expect(page).to have_content('Wiki created successfully!')
	end

	scenario 'sees \'No wikis have been created\' if no wikis exist' do
		visit wikis_path
		expect(page).to have_content("No wikis have been created")
	end
end
