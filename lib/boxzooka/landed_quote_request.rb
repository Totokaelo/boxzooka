require 'boxzooka/base_request'
require 'boxzooka/landed_quote_request_item'

module Boxzooka
  class LandedQuoteRequest < BaseRequest
    root node_name: 'LandedQuote'

    # ISO 4217
    scalar :currency

    # ISO 3166-1 Alpha-2
    scalar :destination_country_code

    # Country-specific. For US: use 2 char state code.
    scalar :destination_province

    collection :products,
      entry_field_type: :entity,
      entry_type: LandedQuoteRequestItem,
      entry_node_name: 'Item'

    # ISO 3166-1 Alpha-2
    scalar :origin_country_code

    # Country-specific. For US: use 2 char state code.
    scalar :origin_province
  end
end
