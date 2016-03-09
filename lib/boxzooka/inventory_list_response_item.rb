module Boxzooka
  class InventoryListResponseItem < BaseElement
    # Total product quantity currently in warehouse.
    scalar :quantity,
      type: :integer

    # Product quantity that is immediately ready to ship.
    scalar :quantity_ready,
      type: :integer


    # Product SKU - Unique identifier for each product.
    scalar :sku,
      node_name: 'Sku'

    # Boxzooka's internal Warehouse marker.
    scalar :warehouse_id,
      node_name: 'WarehouseID'

    # Warehouse city.
    scalar :warehouse_city

    # Warehouse province / state.
    scalar :warehouse_province

    # 2-Alpha ISO.
    scalar :warehouse_country
  end
end
