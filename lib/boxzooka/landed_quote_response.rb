require 'boxzooka/base_response'
require 'boxzooka/landed_quote_response_rate'

module Boxzooka
  class LandedQuoteResponse < BaseResponse
    scalar :destination_country_code
    scalar :destination_province

    scalar :duty_amount, type: :decimal

    scalar :landed_cost_token

    collection :rates,
      entry_field_type: :entity,
      entry_type: LandedQuoteResponseRate,
      entry_node_name: 'Rate'

    scalar :tax_amount, type: :decimal
  end
end
