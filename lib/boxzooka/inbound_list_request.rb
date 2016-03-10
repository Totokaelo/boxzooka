require 'boxzooka/list_request'

module Boxzooka
  # The InboundList data set is used to list existing inbound notifications within our system.
  # InboundList requests can only be made through our API endpoint via XML. Results are limited to 300.
  class InboundListRequest < ListRequest
    root node_name: 'InboundList'
  end
end
