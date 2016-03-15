require 'boxzooka/list_request'

module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class ProductListRequest < ListRequest
    root node_name: 'ProductList'

    # Keyword or phrase appearing in BrandOrManufacturer field
    filter :brand_search

    # Keyword or phrase appearing in Category field
    filter :category_search

    # Keyword or phrase appearing in the Color field
    filter :color_search

    # Origin country code (ISO2)
    filter :country_of_origin

    # Keyword or phrase appearing in Description or ShortDescription fields
    filter :description_search

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

    # ID of warehouse where the inventory is located
    filter :warehouse_id, node_name: 'WarehouseId'
  end
end
