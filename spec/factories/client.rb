FactoryBot.define do
  factory :client do
    external_id { Faker::Internet.uuid }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    job { Faker::Job.title }
    country { Faker::Address.country }
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
    phone { Faker::PhoneNumber.phone_number }
  end
end
