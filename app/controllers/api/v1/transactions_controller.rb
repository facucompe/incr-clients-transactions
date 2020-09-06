module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        render_paginated Client.find(client_id).transactions
      end

      private

      def client_id
        params.require(:id)
      end
    end
  end
end
