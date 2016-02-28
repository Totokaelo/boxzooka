require 'boxzooka/order'

module Boxzooka
  # The Orders data set is used to instruct our warehouse
  # concerning product orders that require fulfillment.
  class OrdersRequest < BaseRequest
    root node_name: 'Orders'

    collection :orders,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::Order,
      entry_node_name: 'Order'
  end
end
