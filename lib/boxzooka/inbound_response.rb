require 'boxzooka/inbound_response_item'

module Boxzooka
  # Response to the Inbound request.
  class InboundResponse < BaseResponse
    # PO Identifier.
    scalar :po, node_name: 'PO'

    # Items.
    collection :results,
      entry_node_name: 'Item',
      entry_field_type: :entity,
      entry_type: Boxzooka::InboundResponseItem

    def success?
      [
        'Success',        # Success for creates
        'Update Success'  # Success for updates
      ].include?(status)
    end
  end
end
