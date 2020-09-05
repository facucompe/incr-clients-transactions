class UpdateTransactionsJob < ApplicationJob
  def perform
    TransactionsParser.new.parse_transactions(TransactionsService.transactions)
  end
end
