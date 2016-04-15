require 'boxzooka/order'

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

    def cancelled?
      status == 'cancelled'
    end

    def on_hold?
      status == 'on_hold'
    end

    def packing?
      status == 'packing'
    end

    def picking?
      status == 'picking'
    end

    def processed_xml_request?
      status == 'processed_xml_request'
    end

    def shipment_created?
      status == 'shipment_created'
    end

    def shipped?
      status == 'shipped'
    end
  end
end
