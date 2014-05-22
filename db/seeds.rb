require 'faker'

#create Users
5.times do
	user = User.new(
		 name:			Faker::Name.name,
		 email:			Faker::Internet.email,
		 password:	Faker::Lorem.characters(10)
	)
	user.skip_confirmation!
	user.save
end

# Create Wikis
15.times do
	Wiki.create(
		title:				Faker::Lorem.sentence,
		description:	Faker::lorem.paragraph
		)
end

wikis = Wikis.all

50.times do
	Page.create(
		user:			users.sample,
		wiki:			wikis.sample,
		title:		Faker::Lorem.sentence,
		body:			Faker::Lorem.paragraph
	)
end
