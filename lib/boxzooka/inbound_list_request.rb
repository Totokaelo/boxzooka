require 'boxzooka/list_request'

module Boxzooka
  # The InboundList data set is used to list existing inbound notifications within our system.
  # InboundList requests can only be made through our API endpoint via XML. Results are limited to 300.
  class InboundListRequest < ListRequest
    root node_name: 'InboundList'

    # Container Id for the Inbound.
    filter :container_id, node_name: 'ContainerID'

    # Minimum date the Inbound data was sent.
    filter :date_from


    # Maximum date the Inbound data was sent.
    filter :date_to

    # Keyword appearing in description.
    filter :description_search

    # PO id - this is your primary key.
    filter :po, node_name: 'PO'

    # Status of inbound object.
    # data_received, arrived, received, stocked, canceled, discrepancy.
    filter :item_status
  end
end
