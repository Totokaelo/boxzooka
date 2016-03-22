require 'boxzooka/order_item'

module Boxzooka
  class OrdersListResponseItem < OrderItem
    # Notes regarding hold_status.
    scalar :hold_notes

    # Status of a hold on the item, if applicable.
    scalar :hold_status

    # Status of the Item.
    scalar :item_status
  end
end
