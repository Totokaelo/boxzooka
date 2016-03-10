require 'boxzooka/base_request'
require 'boxzooka/list_filter'

module Boxzooka
  # Base class for list requests, which are quite common.
  class ListRequest < BaseRequest
    def self.filter(opts)
      ListFilter.new(opts)
    end

    collection :filters,
      flat: true,
      entry_node_name: 'Filter',
      entry_field_type: :entity,
      entry_type: ListFilter

    # AND / OR
    # Defaults to AND.
    scalar :filter_logic

    # Field to order by.
    scalar :order_by

    # Direction of order. ASC or DESC.
    scalar :sort

    scalar :skip_count, type: :integer
  end
end
