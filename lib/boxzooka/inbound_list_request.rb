require 'boxzooka/list_filter'

module Boxzooka
  # The InboundList data set is used to list existing inbound notifications within our system.
  # InboundList requests can only be made through our API endpoint via XML. Results are limited to 300.
  class InboundListRequest < BaseRequest
    Filter = Class.new(ListFilter)

    def self.filter(opts)
      Filter.new(opts)
    end

    root node_name: 'InboundList'

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
