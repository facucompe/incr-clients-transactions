require 'rails_helper'

describe ClientsService do
  describe 'find_client' do
    subject(:find_client) { described_class.find_client(client_id) }

    let(:stub_service_request) do
      stub_request(:get, Rails.application.credentials.client_transaction_service[:base_uri] +
                         "/clients/#{client_id}")
        .to_return(body: body, status: status, headers: { 'Content-Type': 'text/html' })
    end

    before { stub_service_request }

    context 'when the service response is OK' do
      let(:body) { File.read('./spec/support/fixtures/find_client.json') }
      let(:status) { 200 }
      let(:client_id) { Faker::Alphanumeric.alpha(number: 10) }

      it 'finds the client and it parse it' do
        expect(find_client).to be_a(Hash)
      end

      it 'has all fields' do
        expect(find_client.keys.size).to eq(9)
      end
    end

    context 'when the service response is NOT OK' do
      let(:body) {}
      let(:status) { 500 }
      let(:client_id) { Faker::Alphanumeric.alpha(number: 10) }

      it 'rises an Exception' do
        expect { find_client }.to raise_error(ServiceError)
      end
    end
  end
end
