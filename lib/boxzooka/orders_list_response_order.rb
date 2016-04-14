require 'boxzooka/order'
require 'boxzooka/orders_list_response_item'

module Boxzooka
  # Order object on the OrdersList Request.
  class OrdersListResponseOrder < Order
    root node_name: 'Order'

    # Notes regarding hold_status.
    scalar :hold_notes

    # Status of a hold on the item, if applicable.
    scalar :hold_status

    # Status of the Order.
    scalar :status

    # Notes regarding status.
    scalar :order_notes
  end
end
