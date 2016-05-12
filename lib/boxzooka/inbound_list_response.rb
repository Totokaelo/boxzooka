require 'boxzooka/inbound_list_response_inbound'

module Boxzooka
  # Response to the InboundList Request.
  class InboundListResponse < BaseResponse
    collection :results,
      entry_field_type: :entity,
      entry_node_name: 'Inbound',
      entry_type: Boxzooka::InboundListResponseInbound
  end
end
