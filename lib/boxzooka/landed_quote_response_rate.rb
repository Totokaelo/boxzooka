require 'boxzooka/base_element'
require 'boxzooka/landed_quote_response_rate_fee'

module Boxzooka
  class LandedQuoteResponseRate < BaseElement
    collection :fees,
      flat: true,
      entry_field_type: :entity,
      entry_type: LandedQuoteResponseRateFee,
      entry_node_name: 'Fee'

    scalar :max_delivery_days, type: :integer
    scalar :method_code
    scalar :rate_token
  end
end
