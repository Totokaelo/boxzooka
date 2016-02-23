module Boxzooka
  # Authentication object required for all requests.
  class CustomerAccess
    attr_accessor :customer_id
    attr_accessor :customer_key
  end
end
