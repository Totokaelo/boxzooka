module Boxzooka
  class Item < BaseElement
    # Product Brand or Manufacturer
    scalar :brand_or_manufacturer

    # Currency of declared_customs_value
    scalar :currency_code

    # Category of product. - Helps with customs classification.
    scalar :category

    # Color of product.
    scalar :color

    # ISO2 Country in which product was manufactured.
    scalar :country_of_origin

    # Value of Product
    scalar :declared_customs_value, type: :decimal

    # Necessary for customs classification.
    scalar :description

    # Height of product. Helps with shipping cost evaluation.
    scalar :dim_height, type: :decimal

    # Length of product. Helps with shipping cost evaluation.
    scalar :dim_length, type: :decimal

    # Unit of measurement used by DimWidth DimHeight & DimLength fields
    # IN or CM
    scalar :dim_unit

    # Width of product. Helps with shipping cost evaluation.
    scalar :dim_width, type: :decimal

    # URL of product image. Useful for verification and QC processes in warehouse.
    scalar :image_url

    # Product name
    scalar :item_name

    # URL of product. Customs prefer to use the authentic product URL to verify product value.
    scalar :item_url

    # Product materials. Useful for customs classification.
    scalar :materials

    # A more concise and meaningful description than your standard Description field.
    # Something “to the point” i.e. “Wool Knit Cap” or “Denim Jeans”.
    # Very useful for customs classification.
    scalar :short_description

    # Product size. Useful for customs classification.
    scalar :size

    # Product SKU - Unique identifier for each product
    scalar :sku

    # UCC product code
    scalar :ucc, type: :integer, node_name: 'UCC'

    # UPC Vendor Barcode fo Product
    scalar :upc_vendor_barcode

    # Weight of product. Required for shipping cost evaluation.
    scalar :weight, type: :decimal

    # Unit of weight used by Weight field
    # LBS or KGS
    scalar :weight_unit
  end
end
