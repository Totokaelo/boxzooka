module Boxzooka
  class ResponseItem < BaseElement
    # SKU of the Item.
    field :sku

    # Status. Either 'Success' or 'Error'.
    field :status

    # Error message. Can be blank when Status == 'Success'
    field :error_message
  end
end
