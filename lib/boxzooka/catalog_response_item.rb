module Boxzooka
  # Response Items from Boxzooka for CatalogRequest.
  class CatalogResponseItem < BaseElement
    # Error message. Can be blank when Status == 'Success'
    scalar :error_message

    # Status. Either 'Success' or 'Error'.
    scalar :status

    # SKU of the Item.
    scalar :sku

    def success?
      [
        'Success',        # Success for creates
        'Update Success'  # Success for updates
      ].include?(status)
    end
  end
end
