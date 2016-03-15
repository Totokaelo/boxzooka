
module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class InventoryListRequest < ListRequest
    root node_name: 'InventoryList'

    filter :category
    filter :quantity_max
    filter :quantity_min
    filter :sku
    filter :warehouse_id, node_name: 'WarehouseID'
  end
end
