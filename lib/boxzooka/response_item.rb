module Boxzooka
  class ResponseItem
    # SKU of the Item.
    attr_accessor :sku

    # Status. Either 'Success' or 'Error'.
    attr_accessor :status

    # Error message. Can be blank when Status == 'Success'
    attr_accessor :error_message
  end
end
