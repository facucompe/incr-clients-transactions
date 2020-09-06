FactoryBot.define do
  factory :payment do
    client
    total_amount { Faker::Number.number(digits: 5) }
    total_discounts { Faker::Number.number(digits: 3) }
    total_with_discounts { total_amount - total_discounts }
    payment_date { Faker::Date.between(from: '2015-01-01', to: '2025-01-01') }
  end
end
