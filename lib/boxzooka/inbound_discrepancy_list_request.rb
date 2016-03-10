require 'boxzooka/list_request'

module Boxzooka
  # The InboundDiscrepancy data set is used by Boxzooka to provide you with information about
  # discrepancies between what your Inbound notifications declared, and what we actually received.
  class InboundDiscrepancyListRequest < ListRequest
    root node_name: 'InboundDiscrepancyList'
  end
end
