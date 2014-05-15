FactoryGirl.define do
	factory :admin do
		email { Faker::Internet.email }
		password 'secretpassword'
		password_confirmation 'secretpassword'
		confirmed_at Time.now
		role 'admin'
	end
end
