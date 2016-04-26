require 'boxzooka/inbound_request_item'

module Boxzooka
  # Inbound data set is used to send notifications to our system of product inventory
  # that you’re sending to Boxzooka.

  # In practice, you must hit a CatalogRequest for all of the items listed here before the Inbound
  # will be created.
  class InboundRequest < BaseRequest
    root node_name: 'Inbound'

    # Purchase order number
    scalar :po, node_name: 'PO'

    # ID of incoming shipping container
    scalar :container_id, node_name: 'ContainerID'

    # Carrier being used for shipment
    scalar :carrier

    # Tracking number of shipment
    scalar :tracking_code

    # Date/Time that inventory was shipped
    scalar :ship_date, type: :datetime

    # Date/Time that shipment is estimated to arrive in our warehouse.
    scalar :estimated_delivery_date, type: :datetime

    collection :items,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::InboundRequestItem,
      entry_node_name: 'Item'
  end
end
