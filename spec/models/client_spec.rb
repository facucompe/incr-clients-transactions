require 'rails_helper'

describe Client do
  context 'when creating a client' do
    subject(:client) { create(:client) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_uniqueness_of(:external_id) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to have_many(:payments) }
    it { is_expected.to have_many(:transactions) }
  end
end
