module Api
  module V1
    class PaymentsController < ApplicationController
      def index
        render_paginated Client.find(client_id).payments
      end

      private

      def client_id
        params.require(:id)
      end
    end
  end
end
