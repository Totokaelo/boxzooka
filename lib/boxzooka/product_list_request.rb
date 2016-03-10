require 'boxzooka/list_request'

module Boxzooka
  # Request to list Products (or 'Items') on Boxzooka's DB.
  # Limit 300 Items returned per request.
  class ProductListRequest < ListRequest
    root node_name: 'ProductList'
  end
end
