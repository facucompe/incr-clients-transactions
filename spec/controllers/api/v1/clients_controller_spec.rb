require 'rails_helper'

describe Api::V1::ClientsController do
  describe '#index' do
    subject(:make_request) { get :index, params: params }

    let(:clients) { create_list(:client, 3) }

    describe 'withount paginating' do
      let(:params) {}

      before do
        clients
        make_request
      end

      it 'responds with ok status' do
        expect(response).to have_http_status :ok
      end

      it 'responds with 3 clients' do
        expect(response_body['page'].size).to eq(3)
      end

      it 'matches the expected schema' do
        expect(response).to match_response_schema('clients_index')
      end
    end

    describe 'with paginating' do
      let(:params) { { page: 2, limit: 2 } }

      before do
        clients
        make_request
      end

      it 'responds with ok status' do
        expect(response).to have_http_status :ok
      end

      it 'responds with 3 clients' do
        expect(response_body['page'].size).to eq(1)
      end

      it 'matches the expected schema' do
        expect(response).to match_response_schema('clients_index')
      end
    end
  end
end
