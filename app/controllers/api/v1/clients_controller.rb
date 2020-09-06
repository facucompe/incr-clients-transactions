module Api
  module V1
    class ClientsController < ApplicationController
      def index
        render_paginated Client.all
      end
    end
  end
end
