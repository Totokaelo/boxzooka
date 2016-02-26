module Boxzooka
  # Generic ListFilter. Essentially a WHERE clause.
  class ListFilter < BaseElement
    root node_name: 'Filter'

    # Field to target.
    scalar :filter_type

    # Value to filter by.
    scalar :filter_value
  end
end
