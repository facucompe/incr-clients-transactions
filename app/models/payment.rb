class Payment < ApplicationRecord
  validates :payment_date, presence: true

  belongs_to :client
end
