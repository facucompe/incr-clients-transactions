class ClientsService
  include HTTParty
  base_uri Rails.application.credentials.client_transaction_service[:base_uri]
  headers 'Authorization':
          "Bearer #{Rails.application.credentials.client_transaction_service[:token]}"

  NULL_RESPONSE = 'null'.freeze

  def self.find_client(client_id)
    response = get("/clients/#{client_id}")
    return JSON.parse(response.body) if response.ok? && response.body != NULL_RESPONSE

    raise ServiceError, 'Client service error'
  end
end
