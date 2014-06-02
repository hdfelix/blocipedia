require 'spec_helper'

feature 'User visit blocipedia' do

  scenario 'signs up' do
    user = build(:user)
    visit root_path
		within('ul div') do
			click_link 'Sign Up'
		end
    expect{
      within 'form#new_user' do
        fill_in 'Name', with: user.name
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password 
        fill_in 'Password confirmation', with: user.password_confirmation 
        click_button 'Sign up'
      end
    }.to change(User, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please open the link to activate your account.')
  end

  scenario 'signs in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    within 'form#new_user' do
      fill_in 'Email', with: user.email 
      fill_in 'Password', with: user.password 
      click_button 'Sign in'
    end
    expect(page).to have_content('Signed in successfully.')
  end
end

feature 'User clicks \'Wikis list\'' do

  scenario 'Views list of existing wikis' do
		user = create(:user)
    FactoryGirl.create(:wiki, title: 'Test Wiki')
    visit root_path
    click_link 'Sign In'
    within 'form#new_user' do
      fill_in 'Email', with: user.email 
      fill_in 'Password', with: user.password 
      click_button 'Sign in'
    end

    click_link 'Wikis'
    expect(page).to have_content('Free Wikis')
    expect(page).to have_content('Test Wiki')
  end

  scenario 'Views \'no wikis\' message if no wikis exist' do
    puts "current wikis: #{Wiki.all.count}"
    visit root_path
    click_link 'Wikis'
    expect(page).to have_content('No wikis have been created.')
  end

end
