require 'boxzooka/shipment'

module Boxzooka
  class ShipmentsListResponse < BaseResponse
    collection :results,
      entry_node_name: 'Shipment',
      entry_field_type: :entity,
      entry_type: Boxzooka::Shipment
  end
end
