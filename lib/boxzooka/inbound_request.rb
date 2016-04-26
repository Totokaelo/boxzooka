require 'boxzooka/inbound_request_item'

module Boxzooka
  # Inbound data set is used to send notifications to our system of product inventory
  # that you’re sending to Boxzooka.

  # In practice, you must hit a CatalogRequest for all of the items listed here before the Inbound
  # will be accepted.
  class InboundRequest < BaseRequest
    root node_name: 'Inbound'

    # ID of incoming shipping container
    scalar :container_id, node_name: 'ContainerID'

    # Carrier being used for shipment
    scalar :carrier

    # Date/Time that shipment is estimated to arrive in our warehouse.
    scalar :estimated_delivery_date, type: :datetime

    # Purchase order number
    scalar :po, node_name: 'PO'

    # Tracking number of shipment
    scalar :tracking_code

    # Date/Time that inventory was shipped
    scalar :ship_date, type: :datetime

    # Items on the Inbound shipment.
    collection :items,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::InboundRequestItem,
      entry_node_name: 'Item'
  end
end
