require 'spec_helper'

feature 'User signs up for Premium account'

feature 'User creates a premium wiki' do
  scenario 'successfully' do
		@user = create(:premium_user)
		@wiki = build(:wiki)
		@wiki.update_attributes(public: false, user_id: @user_id)
		@wiki.save
		
    visit root_path
    click_link 'Sign In'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Sign in'

    click_link 'Wikis'

    within("//div[@id='private_wikis']") do
      click_link 'New Private Wiki'
		end
    expect {
			within('form#new_wiki') do
				fill_in 'wiki_title', with: @wiki.title
				fill_in 'wiki_description', with: @wiki.description
				#public should already be set to false
				click_button 'Create Wiki'
			end
		}.to change(Wiki, :count).by(1)
  end
end

feature 'User upgrades free wiki'


