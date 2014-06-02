FactoryGirl.define do
	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		password 'secretpassword'
		password_confirmation 'secretpassword'
		confirmed_at Time.now
		role ''
	end

	factory :premium_user, class: User do
		name 'Money Man'
		email 'admin@fake.com'
		password 'secretpwd'
		password_confirmation 'secretpwd'
		confirmed_at Time.now
		#stripe_card_token 'tok_2014FA4jVCc5mZjr0Zw8VQw7'
	end
end
