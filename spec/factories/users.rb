FactoryGirl.define do
	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		password 'secretpassword'
		password_confirmation 'secretpassword'
		confirmed_at Time.now
		role ''
	end

	factory :admin, class: User do
		name 'Admin'
		email 'admin@fake.com'
		password 'secretpwd'
		password_confirmation 'secretpwd'
		confirmed_at Time.now
		role 'admin'
	end
end
