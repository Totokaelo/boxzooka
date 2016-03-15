module Boxzooka
  class ProductListResponse < BaseResponse
    collection :results,
      entry_node_name: 'Item',
      entry_field_type: :entity,
      entry_type: Boxzooka::Item
  end
end
