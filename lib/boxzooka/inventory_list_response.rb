require 'boxzooka/inventory_list_response_item'

module Boxzooka
  class InventoryListResponse < BaseResponse
    collection :results,
      entry_node_name: 'Item',
      entry_field_type: :entity,
      entry_type: Boxzooka::InventoryListResponseItem
  end
end
