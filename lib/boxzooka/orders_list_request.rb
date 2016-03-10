require 'boxzooka/list_request'

module Boxzooka
  class OrdersListRequest < ListRequest
    root node_name: 'OrdersList'
  end
end
