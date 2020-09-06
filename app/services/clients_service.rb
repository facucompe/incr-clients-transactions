class ClientsService
  include HTTParty
  base_uri Rails.application.credentials.client_transaction_service[:base_uri]
  headers 'Authorization':
          "Bearer #{Rails.application.credentials.client_transaction_service[:token]}"

  NULL_RESPONSE = 'null'.freeze

  def self.find_client(client_id)
    response = get("/clients/#{client_id}")
    if response.ok? && response.body != NULL_RESPONSE
      return build_client(JSON.parse(response.body))
    end

    raise ServiceError, 'Client service error'
  end

  def self.build_client(client_params)
    Client.new(external_id: client_params['id'], email: client_params['email'],
               first_name: client_params['first_name'], last_name: client_params['last_name'],
               job: client_params['job'], country: client_params['country'],
               address: client_params['address'], zip_code: client_params['zip_code'],
               phone: client_params['phone'])
  end
end
