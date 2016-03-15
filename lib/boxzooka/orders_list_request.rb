require 'boxzooka/list_request'

module Boxzooka
  class OrdersListRequest < ListRequest
    root node_name: 'OrdersList'

    filter :address1
    filter :address2
    filter :address3

    # Category of product in shipment
    filter :category

    # Unique ID of order
    filter :order_id, node_name: 'OrderId'

    # Sku of product in shipment
    filter :sku
  end
end
