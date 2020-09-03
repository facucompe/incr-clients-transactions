require 'rails_helper'

describe TransactionsService do
  describe 'transactions' do
    subject(:transactions) { described_class.transactions }

    let(:stub_service_request) do
      stub_request(:get, Rails.application.credentials.client_transaction_service[:base_uri] +
                         '/file.txt')
        .to_return(body: body, status: status, headers: { 'Content-Type': 'text/plain' })
    end

    before { stub_service_request }

    context 'when the service response is OK' do
      let(:body) { File.read('./spec/support/fixtures/transactions.txt') }
      let(:status) { 200 }

      it 'finds the client and it parse it' do
        expect(transactions).to be_a(String)
      end

      it 'has all fields' do
        expect(transactions).to eq(body)
      end
    end

    context 'when the service response is NOT OK' do
      let(:body) {}
      let(:status) { 500 }

      it 'rises an Exception' do
        expect { transactions }.to raise_error(ServiceError)
      end
    end
  end
end
