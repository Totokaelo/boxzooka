module Boxzooka
  # Response to the InboundList Request.
  class InboundListResponse < BaseListResponse
    collection :results,
      entry_node_name: 'Inbound',
      entry_field_type: :entity,
      entry_type: Boxzooka::InboundListResponse

  end
end
