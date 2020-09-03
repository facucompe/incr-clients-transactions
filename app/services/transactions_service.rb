class TransactionsService
  include HTTParty
  base_uri Rails.application.credentials.client_transaction_service[:base_uri]
  headers 'Authorization':
          "Bearer #{Rails.application.credentials.client_transaction_service[:token]}"

  def self.transactions # TODO : Replace raw string method response with a class
    response = get('/file.txt')
    return response.body if response.ok?

    raise ServiceError, 'Transactions service error'
  end
end
