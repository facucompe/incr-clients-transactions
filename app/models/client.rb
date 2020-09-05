class Client < ApplicationRecord
  validates :external_id, :email, :first_name, :last_name, presence: true
end
