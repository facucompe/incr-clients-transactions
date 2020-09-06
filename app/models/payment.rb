class Payment < ApplicationRecord
  validates :total_amount, :total_discounts,
            :total_with_discounts, :payment_date, presence: true

  belongs_to :client
end
