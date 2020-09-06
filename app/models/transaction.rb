class Transaction < ApplicationRecord
  validates :amount, :currency, presence: true
  enum currency: { ars: 1, usd: 2 }

  belongs_to :client
end
