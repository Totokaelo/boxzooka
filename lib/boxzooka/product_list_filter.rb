module Boxzooka
  # Essentially a WHERE clause for ProductList webservice.
  class ProductListFilter < BaseElement
    root node_name: 'Filter'

    # Field to target.
    scalar :filter_type

    # Value to filter by.
    scalar :filter_value
  end
end
