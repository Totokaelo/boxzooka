module Boxzooka
  # Request to populate Boxzooka's Item metadata from our own.
  class CatalogRequest < BaseRequest
    # List of Items
    attr_accessor :items
  end
end
