require 'boxzooka/base_element'

module Boxzooka
  # Line Item for Shipment entities.
  class ShipmentItem < BaseElement
    # URL of product.
    scalar :product_url

    # Quantity of SKU to be shipped.
    scalar :quantity, type: :integer

    # SKU of Product to be shipped.
    scalar :sku

    # UCC Product Code.
    scalar :ucc, node_name: 'UCC', type: :integer

    # Declared value of single product.
    scalar :unit_value, type: :decimal

    # UPC Vendor Barcode of Product.
    scalar :upc_vendor_barcode
  end
end
