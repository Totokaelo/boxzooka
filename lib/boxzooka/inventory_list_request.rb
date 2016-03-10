require 'boxzooka/list_request'

module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class InventoryListRequest < BaseRequest
    # Available Filters
    # Sku, Category, QuantityMin, QuantityMax, WarehouseID

    root node_name: 'InventoryList'
  end
end
