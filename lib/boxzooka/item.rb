module Boxzooka
  class Item
    # Product Brand or Manufacturer
    attr_accessor :brand_or_manufacturer

    # Currency of declared_customs_value
    attr_accessor :currency_code

    # Category of product. - Helps with customs classification.
    attr_accessor :category

    # Color of product
    attr_accessor :color

    # ISO2 Country in which product was manufactured
    attr_accessor :country_of_origin

    # Value of Product
    attr_accessor :declared_customs_value

    # Necessary for customs classification.
    attr_accessor :description

    # Height of product. Helps with shipping cost evaluation.
    attr_accessor :dim_height

    # Length of product. Helps with shipping cost evaluation.
    attr_accessor :dim_length

    # Unit of measurement used by DimWidth DimHeight & DimLength fields
    attr_accessor :dim_unit

    # Width of product. Helps with shipping cost evaluation.
    # IN or CM
    attr_accessor :dim_width

    # URL of product image. Useful for verification and QC processes in warehouse.
    attr_accessor :image_url

    # Product name
    attr_accessor :item_name

    # URL of product. Customs prefer to use the authentic product URL to verify product value.
    attr_accessor :item_url

    # Product materials. Useful for customs classification.
    attr_accessor :materials

    # A more concise and meaningful description than your standard Description field.
    # Something “to the point” i.e. “Wool Knit Cap” or “Denim Jeans”.
    # Very useful for customs classification.
    attr_accessor :short_description

    # Product size. Useful for customs classification.
    attr_accessor :size

    # Product SKU - Unique identifier for each product
    attr_accessor :sku

    # UCC product code
    attr_accessor :ucc

    # UPC Vendor Barcode fo Product
    attr_accessor :upc_vendor_barcode

    # Weight of product. Required for shipping cost evaluation.
    attr_accessor :weight

    # Unit of weight used by Weight field
    # LBS or KGS
    attr_accessor :weight_unit
  end
end
