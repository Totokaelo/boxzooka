module Boxzooka
  # Authentication object required for all requests.
  class CustomerAccess < BaseElement
    field :customer_id
    field :customer_key
  end
end
