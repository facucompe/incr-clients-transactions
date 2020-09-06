require 'rails_helper'

describe Transaction do
  context 'when creating a transaction' do
    subject(:transaction) { create(:transaction) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:currency) }
  end
end
