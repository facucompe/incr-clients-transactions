class TransactionsParser
  include TransactionsFileStructure

  def initialize
    @transactions = []
  end

  def parse_transactions(raw_transactions)
    raw_transactions.split("\n").each { |line| parse_line(line) }
  end

  def parse_line(line)
    case line.slice LINE_TYPE
    when HEADER
      read_header(line)
    when TRANSACTION
      read_transaction(line)
    when FOOTER
      commit_transactions(line)
    end
  end

  def read_header(line)
    @header = {
      currency: CURRENCIES[line.slice(CURRENCY).to_sym],
      total_amount: line.slice(TOTAL_AMOUNT).to_f / 100,
      total_discounts: line.slice(TOTAL_DISCOUNTS).to_f / 100,
      total_with_discounts: line.slice(TOTAL_WITH_DISCOUNTS).to_f / 100
    }
  end

  def read_transaction(line)
    @transactions << Transaction.new(amount: line.slice(AMOUNT).to_f / 100,
                                     currency: @header[:currency],
                                     approved?: APPROVED_VALUES[line.slice(APPROVED).to_sym])
  end

  def commit_transactions(line)
    client = find_or_create_client(line.slice(CLIENT_ID))
    @transactions.each do |transaction|
      transaction.client = client
      transaction.save
    end
    @transactions = []
  end

  def find_or_create_client(client_id)
    client = Client.find_by(external_id: client_id)
    client || create_client(client_id)
  end

  def create_client(client_id)
    client = ClientsService.find_client(client_id)
    client.save
    client
  end
end
