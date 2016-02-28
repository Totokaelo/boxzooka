require 'boxzooka/list_filter'

module Boxzooka
  # The InboundDiscrepancy data set is used by Boxzooka to provide you with information about
  # discrepancies between what your Inbound notifications declared, and what we actually received.
  class InboundDiscrepancyListRequest < BaseRequest
    Filter = Class.new(ListFilter)

    def self.filter(opts)
      Filter.new(opts)
    end

    root node_name: 'InboundDiscrepancyList'

    collection :filters,
      flat: true,
      entry_node_name: 'Filter',
      entry_field_type: :entity,
      entry_type: Filter

    # Field to order by.
    scalar :order_by

    # Direction of order. ASC or DESC.
    scalar :sort

    scalar :skip_count, type: :integer
  end
end
