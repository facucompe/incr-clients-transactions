class Client < ApplicationRecord
  validates :external_id, :email, :first_name, :last_name, presence: true

  has_many :transactions, dependent: :destroy
end
