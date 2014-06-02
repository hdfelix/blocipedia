# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki do
    title { Faker::Lorem.words(3, false).join(' ') }
    description { Faker::Lorem.sentence }
    user
  end

  factory :private_wiki, class: Wiki do
    title { Faker::Lorem.words(3, false).join(' ') }
    description { Faker::Lorem.sentence }
    public false
    user
  end
end
