require 'boxzooka/item'

module Boxzooka
  # Request to populate Boxzooka's Item metadata from our own.
  class CatalogRequest < BaseRequest
    # List of Items
    collection :items,
      entry_node_name: 'Item',
      entry_field_type: :entity,
      entry_type: Boxzooka::Item

  end
end
