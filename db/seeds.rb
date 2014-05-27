require 'faker'

#create Users
user_count = 5
puts "Creating #{user_count} users:"
user_count.times do
	print "."
	user = User.new(
		 name:			Faker::Name.name,
		 email:			Faker::Internet.email,
		 password:	Faker::Lorem.characters(10)
	)
	user.skip_confirmation!
	user.save
end

# Create Wikis
wiki_count = 15
puts "\nCreating #{wiki_count} wikis:"
wiki_count.times do
	print "."
	Wiki.create(
		title:				Faker::Lorem.sentence,
		description:	Faker::Lorem.paragraph
		)
end

#Adding pages to wikis
puts "\nCreate random # of pages in wikis"

@wikis = Wiki.all 
@wikis.each do |w|
	rand(2..7).times do
		print "."	
		w.pages.create(
			#User.find(rand(1..5)).user_id,
			title:		Faker::Lorem.sentence,
			body:			Faker::Lorem.paragraph
		)
	end
end

puts "\n\n"

