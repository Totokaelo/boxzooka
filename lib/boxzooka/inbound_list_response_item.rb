module Boxzooka
  # 'Item' elements on the InboundListResponse.
  class InboundListResponseItem < BaseElement
    root node_name: 'Item'

    # Inbound-specific description of item.
    scalar :description

    # 'data_received', 'arrived', 'received', 'stocked', 'canceled', 'discrepancy', 'unreconciled'
    scalar :item_status

    # Quantity of inbound product.
    scalar :quantity, type: :integer

    # Received units
    scalar :received, type: :integer

    # Inbound-specific short description of item.
    scalar :short_description

    # Item SKU. Primary key.
    scalar :sku

    # UpcVendorBarcode.
    scalar :upc_vendor_barcode
  end
end
