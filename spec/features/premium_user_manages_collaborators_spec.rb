require 'spec_helper'

feature 'Premium user manages collaborators' do
	before do
		@user = create(:premium_user)
    @wiki = build(:wiki)
		@wiki.update_attributes(public: false, user_id: @user.id)
		@wiki.save
	end
  scenario 'User views Private wiki\'s list of collaborators' do

    visit root_path
		within(:css, 'ul div') {
			click_link 'Sign In'
	 	}
		fill_in 'user_email', with: @user.email
		fill_in 'user_password', with: @user.password
		click_button 'Sign in'

    click_link 'Wikis'
    within("//div[@id='private_wikis']") do
      within(:css, 'h4') do
				click_link "#{@wiki.pages.count} pages"
			end
    end

    #Expect the list of collaborators section
    expect(page).to have_content("Collaborators")

  end

  scenario 'User Adds a collaborator successfully' do		
    visit root_path
		within(:css, 'ul div') {
			click_link 'Sign In'
	 	}
		fill_in 'user_email', with: @user.email
		fill_in 'user_password', with: @user.password
		click_button 'Sign in'

    click_link 'Wikis'
    within("//div[@id='private_wikis']") do
      within(:css, 'h4') do
				click_link "#{@wiki.pages.count} pages"
			end
    end
		click_link 'Add collaborator'
	end

  scenario 'User Removes a collaborator successfully'
end
