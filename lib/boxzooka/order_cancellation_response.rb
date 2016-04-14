require 'boxzooka/order_cancellation_response_response'

module Boxzooka
  # Response type for the OrderCancellation endpoint.
  class OrderCancellationResponse < BaseResponse
    collection :responses,
      flat: true,
      entry_node_name: 'Response',
      entry_field_type: :entity,
      entry_type: Boxzooka::OrderCancellationResponseResponse
  end
end
