require 'boxzooka/list_request'

module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class InventoryListRequest < ListRequest
    root node_name: 'InventoryList'

    # Category of Product.
    filter :category

    # Maximum inventory quantity.
    filter :quantity_max

    # Minimum inventory quantity.
    filter :quantity_min

    # SKU of Product.
    filter :sku

    # Id of warehouse where inventory is located.
    filter :warehouse_id, node_name: 'WarehouseID'
  end
end
