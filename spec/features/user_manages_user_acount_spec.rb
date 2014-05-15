require 'spec_helper'

feature 'User management' do
	scenario 'add a new user' do
		admin = create(:admin)

		visit roo_path
		click_link 'Log in'
		fill_in 'Email', with: admin.email
		fill_in 'Password', with: admin.password
		click_button 'Log In'

		visit root_path
		expect{
		click_link 'Users'
		click_link 'New User'
		fill_in 'Email', with: 'newuser@example.com'
		find('#password').fill_in 'Password', with: 'secrect123'
		find('#password_confimrmation').fill_in 'password_confirmation', with: 'secret123'
		click_button 'Create User'
		}.to change(User, :count).by(1)
		expect(current_path).to eq users_path
		expect(page).to have_content 'New user created'
		within 'h1' do
			expect(page).to have_content 'Users'
		end
		expect(page).to have_content 'newuser@example.com'
	end
end
