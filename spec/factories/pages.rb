# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    body { Faker::Lorem.paragraph }
		wiki
  end
end
