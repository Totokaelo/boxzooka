module Boxzooka
  # Line Items for the InboundRequest.
  class InboundRequestItem < BaseElement
    # Inbound-specific description of item.
    scalar :description

    # Quantity of inbound product.
    scalar :quantity

    # Inbound-specific short description of item.
    scalar :short_description

    # Item SKU. Primary key.
    scalar :sku

    # UpcVendorBarcode.
    scalar :upc_vendor_barcode
  end
end
