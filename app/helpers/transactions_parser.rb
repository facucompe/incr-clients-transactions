class TransactionsParser
  include TransactionsFileStructure

  def parse_transactions(raw_transactions)
    raw_transactions.split("\n").each { |line| parse_line(line) }
  end

  def parse_line(line)
    case line.slice LINE_TYPE
    when HEADER
      read_header(line)
    when TRANSACTION
      read_transaction(line)
    when DISCOUNT
      read_discount(line)
    when FOOTER
      commit_transactions(line)
    else
      'Error'
    end
  end

  def read_header(line) end

  def read_transaction(line) end

  def read_discount(line) end

  def commit_transactions(line)
    client = find_or_create_client(line.slice(CLIENT_ID))
  end

  def find_or_create_client(clien_external_id) end
end
