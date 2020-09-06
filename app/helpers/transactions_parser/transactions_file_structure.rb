class TransactionsParser
  module TransactionsFileStructure
    # Line types
    HEADER = '1'.freeze
    TRANSACTION = '2'.freeze
    DISCOUNT = '3'.freeze
    FOOTER = '4'.freeze

    # Currencies
    CURRENCIES = {
      '000': :ARS,
      '001': :USD
    }.freeze

    APPROVED_VALUES = {
      '1': true,
      '2': false
    }.freeze

    DATE_FORMAT = '%Y%m%d'.freeze

    # Fields
    LINE_TYPE = 0

    # rubocop:disable Style/MutableConstant
    # HEADER
    PAYMENT_ID = 1..32
    CURRENCY = 36..38
    TOTAL_AMOUNT = 39..51
    TOTAL_DISCOUNTS = 52..64
    TOTAL_WITH_DISCOUNTS = 65..77

    # TRANSACTION
    APPROVED = 51
    AMOUNT = 33..45

    # FOOTER
    CLIENT_ID = 24..56
    PAYMENT_DATE = 16..23
    # rubocop:enable Style/MutableConstant
  end
end
