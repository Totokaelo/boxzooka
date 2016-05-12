require 'boxzooka/inbound_list_response_item'

module Boxzooka
  # The "Inbound" object on InboundListResponses.
  # Not the most descriptive name, but fits with our naming hierarchy for now.
  class InboundListResponseInbound < BaseElement
    root node_name: 'Inbound'

    # Date/Time that shipment is estimated to arrive in our warehouse.
    scalar :estimated_delivery_date, type: :datetime

    # Purchase order number
    scalar :po, node_name: 'PO'

    # ID of incoming shipping container
    scalar :container_id, node_name: 'ContainerID'

    collection :items,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::InboundListResponseItem,
      entry_node_name: 'Item'

    # Status of the PO. 'received',
    scalar :status
  end
end
