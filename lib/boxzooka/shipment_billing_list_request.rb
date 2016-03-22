require 'boxzooka/list_request'

module Boxzooka
  class ShipmentBillingListRequest < ListRequest
    root node_name: 'ShipmentBillingList'

    # Minimum date of when the order was created.
    filter :order_date_from

    # Maximum date of when the order was created.
    filter :order_date_to

    # Maximum bill value
    filter :price_max

    # Minimum bill value
    filter :price_min

    # Minimum date of when the shipment was created.
    filter :shipment_date_from

    # Maximum date of when the shipment was created.
    filter :shipment_date_to

    # ID of corresponding Order.
    filter :order_id, node_name: 'OrderID'

    # Tracking Code of shipment
    filter :tracking_code
  end
end
