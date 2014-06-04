require 'spec_helper'

feature 'Premium user manages collaborators' do
	before do
		@user = create(:premium_user)
		@collaborator = create(:user)
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
		#save_and_open_page
		#binding.pry
		#find("#wiki_collaborators").find(:xpath, "option['#{@collaborator.name}']")
		find(:xpath, "option[value = '2']").select_option
		#find("#wiki_collaborators option[value = @user.name]").select
		click_button 'Add Collaborators'
		#save_and_open_page
		expect(find('#collaborators')).to have_content(@user.name)
	end

  scenario 'User Removes a collaborator successfully' do
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
		select @user.name, from: :wiki_collaborators
		click_button 'Add Collaborators'
		# Add the collaborator
		# Check the collaborator is there
		# Delete the collaborator
		# Check that the collaborator is no longer listed
	end
end
