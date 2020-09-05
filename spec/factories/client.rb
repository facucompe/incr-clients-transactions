FactoryBot.define do
  factory :client do
    external_id { Faker::Internet.uuid }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
