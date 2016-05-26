require 'boxzooka/orders_list_response_order'

module Boxzooka
  class OrdersListResponse < BaseResponse
    collection :results,
      entry_node_name: 'Order',
      entry_field_type: :entity,
      entry_type: Boxzooka::OrdersListResponseOrder

    # Status message. Will be nil if results is populated.
    scalar :status

    # Error message. Will be nil if results is populated.
    scalar :error_message
  end
end
