require 'boxzooka/catalog_response_item'

module Boxzooka
  # Response from Boxzooka for CatalogRequest.
  class CatalogResponse < BaseResponse
    # Array of ResponseItem's
    collection :results,
      entry_node_name: 'Item',
      entry_field_type: :entity,
      entry_type: CatalogResponseItem
  end
end
