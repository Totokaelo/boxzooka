module Boxzooka
  # Response Items from Boxzooka for CatalogRequest.
  class CatalogResponseItem < BaseElement
    # SKU of the Item.
    scalar :sku

    # Status. Either 'Success' or 'Error'.
    scalar :status

    # Error message. Can be blank when Status == 'Success'
    scalar :error_message

    # NEW postings will return 'Success'
    # UPDATES will return 'Update Success'
    def success?
      status =~ /success/
    end
  end
end
