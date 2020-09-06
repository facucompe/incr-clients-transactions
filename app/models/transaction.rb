class Transaction < ApplicationRecord
  validates :amount, :currency, presence: true
  enum currency: { ARS: 1, USD: 2 }

  belongs_to :client
end
