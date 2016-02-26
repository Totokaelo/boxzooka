require 'boxzooka/product_list_filter'

module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class ProductListRequest < BaseRequest
    root node_name: 'ProductList'

    # This might be a flat array
    entity :filter,
      type: Boxzooka::ProductListFilter

    # Field to order by.
    scalar :order_by

    # Direction of order. ASC or DESC.
    scalar :sort

    scalar :skip_count, type: :integer
  end
end
