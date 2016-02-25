module Boxzooka
  class ResponseItem < BaseElement
    # SKU of the Item.
    scalar :sku

    # Status. Either 'Success' or 'Error'.
    scalar :status

    # Error message. Can be blank when Status == 'Success'
    scalar :error_message
  end
end
