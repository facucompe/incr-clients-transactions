class TransactionsParser
  module TransactionsFileStructure
    # Line types
    HEADER = '1'.freeze
    TRANSACTION = '2'.freeze
    DISCOUNT = '3'.freeze
    FOOTER = '4'.freeze

    # Fields
    LINE_TYPE = 0
    # HEADER
    PAYMENT_ID = 1..32

    # FOOTER
    CLIENT_ID = 24..56
  end
end
