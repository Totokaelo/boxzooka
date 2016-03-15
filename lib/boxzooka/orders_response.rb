require 'boxzooka/orders_response_result'

module Boxzooka
  class OrdersResponse < BaseResponse
    collection :results,
      flat: true,
      entry_node_name: 'Response',
      entry_field_type: :entity,
      entry_type: Boxzooka::OrdersResponseResult
  end
end
