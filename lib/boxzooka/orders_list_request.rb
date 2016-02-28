module Boxzooka
  class OrdersListRequest < BaseRequest
    Filter = Class.new(ListFilter)

    def self.filter(opts)
      Filter.new(opts)
    end

    root node_name: 'OrdersList'

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
