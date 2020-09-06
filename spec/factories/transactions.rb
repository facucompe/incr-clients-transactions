FactoryBot.define do
  factory :transaction do
    client
    amount { Faker::Number.number(digits: 5) }
    approved? { [true, false].sample }
    currency { Transaction.currencies.keys.sample }
  end
end
