module Boxzooka
  class InventoryAdjustment < BaseElement
    # Quantity of the adjustment.
    scalar :adjustment, type: :integer

    scalar :adjustment_date, type: :datetime

    scalar :adjustment_type

    scalar :notes

    scalar :order_id, node_name: 'OrderID'

    scalar :po, node_name: 'PO'

    scalar :rma, node_name: 'RMA'

    scalar :sku

    scalar :tracking_code

    scalar :warehouse_id, node_name: 'WarehouseID'

    scalar :warehouse_city

    scalar :warehouse_province

    scalar :warehouse_country
  end
end
