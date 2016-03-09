module Boxzooka
  # Response Items from Boxzooka for CatalogRequest.
  class CatalogResponseItem < BaseElement
    # SKU of the Item.
    scalar :sku

    # Status. Either 'Success' or 'Error'.
    scalar :status

    # Error message. Can be blank when Status == 'Success'
    scalar :error_message

    def success?
      [
        'Success',        # Success for creates
        'Update Success'  # Success for updates
      ].include?(status)
    end
  end
end
