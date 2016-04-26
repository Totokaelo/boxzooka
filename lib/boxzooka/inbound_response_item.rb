module Boxzooka
  # Line Items for the Inbound Response.
  class InboundResponseItem < BaseElement
    # Error Message populated if ItemStatus == 'Error'.
    scalar :error_messoge

    # Item Status: either 'Success', 'Error'.
    scalar :item_status

    # Product SKU.
    scalar :sku
  end
end
