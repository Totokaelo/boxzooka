module Boxzooka
  # Authentication object required for all requests.
  class CustomerAccess < BaseElement
    scalar :customer_id,
      node_name: 'CustomerID'

    scalar :customer_key
  end
end
