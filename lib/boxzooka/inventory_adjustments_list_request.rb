require 'boxzooka/list_request'

module Boxzooka
  class InventoryAdjustmentsListRequest < ListRequest
    root node_name: 'InventoryAdjustmentsList'

    # Keyword or phrase appearing in BrandOrManufacturer field
    filter :brand_search

    # Keyword or phrase appearing in Category field
    filter :category_search

    # Keyword or phrase appearing in the Color field
    filter :color_search

    # Keyword or phrase appearing in Description or ShortDescription fields
    filter :description_search

    # Minimum date of when the adjustments occurred
    filter :date_from

    # Minimum date of when the adjustments occurred
    filter :date_to

    # Keyword or phrase appearing in the ItemName field
    filter :item_name_search

    # Keyword or phrase appearing in Materials field
    filter :materials_search

    # Keyword or phrase appearing in Size field
    filter :size_search

    # Sku of product
    filter :sku

    # Product UpcVendorBarcode
    filter :upc_vendor_barcode

    # Maximum value of product
    filter :value_max

    # Minimum value of product
    filter :value_min

    # Maximum inventory quantity
    filter :quantity_max

    # Minimum inventory quantity
    filter :quantity_min

    # ID of warehouse where the adjustment occurred
    filter :warehouse_id, node_name: 'WarehouseId'
  end
end
