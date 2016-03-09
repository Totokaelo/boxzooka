require 'boxzooka/list_filter'

module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class InventoryListRequest < BaseRequest
    Filter = Class.new(ListFilter)

    def self.filter(opts)
      # Sku, Category, QuantityMin, QuantityMax, WarehouseID
      Filter.new(opts)
    end

    root node_name: 'InventoryList'

    collection :filters,
      flat: true,
      entry_node_name: 'Filter',
      entry_field_type: :entity,
      entry_type: Filter

    # AND / OR
    # Defaults to AND.
    scalar :filter_logic

    # Field to order by.
    scalar :order_by

    # Direction of order. ASC or DESC.
    scalar :sort

    # Amount of results to skip. Used to submit multiple requests when returned results
    # exceed the 300 count limit.
    scalar :skip_count, type: :integer
  end
end
