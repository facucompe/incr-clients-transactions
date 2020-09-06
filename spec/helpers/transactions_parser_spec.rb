require 'rails_helper'

describe TransactionsParser do
  describe '#parse_transactions' do
    subject(:parse_transactions) { described_class.new.parse_transactions(raw_transactions) }

    let(:raw_transactions) { File.read('./spec/support/fixtures/transactions.txt') }

    describe 'when the client service responds OK' do
      let(:clients_service_mock) do
        allow(ClientsService).to receive(:find_client).with('7e1b3cf7977c45418590f1aa7b9ff457')
                                                      .and_return(build(:client))
        allow(ClientsService).to receive(:find_client).with('cf3e054598014f379aff2b319109b862')
                                                      .and_return(build(:client))
      end

      before do
        clients_service_mock
      end

      it 'changes Client count' do
        expect { parse_transactions }.to change(Client, :count).from(0).to(2)
      end

      it 'changes Transactions count' do
        expect { parse_transactions }.to change(Transaction, :count).from(0).to(40)
      end

      it 'changes Payments count' do
        expect { parse_transactions }.to change(Payment, :count).from(0).to(2)
      end
    end

    describe 'when the client service fails' do
      let(:clients_service_mock) do
        allow(ClientsService).to receive(:find_client).with('7e1b3cf7977c45418590f1aa7b9ff457')
                                                      .and_raise(ServiceError)
        allow(ClientsService).to receive(:find_client).with('cf3e054598014f379aff2b319109b862')
                                                      .and_return(build(:client))
      end

      before do
        clients_service_mock
      end

      it 'changes Client count by one' do
        expect { parse_transactions }.to change(Client, :count).from(0).to(1)
      end

      it 'changes Transactions count' do
        expect { parse_transactions }.to change(Transaction, :count).from(0).to(18)
      end

      it 'changes Payments count' do
        expect { parse_transactions }.to change(Payment, :count).from(0).to(1)
      end
    end
  end
end
