require 'rails_helper'

describe Payment do
  context 'when creating a payment' do
    subject(:payment) { create(:payment) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:total_amount) }
    it { is_expected.to validate_presence_of(:total_discounts) }
    it { is_expected.to validate_presence_of(:total_with_discounts) }
    it { is_expected.to validate_presence_of(:payment_date) }
    it { is_expected.to belong_to(:client) }
  end
end
