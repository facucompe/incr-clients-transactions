class Client < ApplicationRecord
  validates :external_id, :email, :first_name, :last_name, presence: true
  validates :external_id, uniqueness: true

  has_many :transactions, dependent: :destroy
  has_many :payments, dependent: :destroy
end
