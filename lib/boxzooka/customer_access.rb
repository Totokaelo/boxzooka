module Boxzooka
  # Authentication object required for all requests.
  class CustomerAccess < BaseElement
    scalar :customer_id
    scalar :customer_key
  end
end
