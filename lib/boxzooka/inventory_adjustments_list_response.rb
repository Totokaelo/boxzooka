require 'boxzooka/inventory_adjustment'

module Boxzooka
  class InventoryAdjustmentsListResponse < BaseResponse
    root node_name: 'InventoryAdjustmentsList'

    collection :results,
      entry_node_name: 'Inventory',
      entry_field_type: :entity,
      entry_type: Boxzooka::InventoryAdjustment
  end
end
