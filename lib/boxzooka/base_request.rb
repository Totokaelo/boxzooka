require 'boxzooka/customer_access'

module Boxzooka
  # Base class for Boxzooka API request objects.
  class BaseRequest < BaseElement
    # Authentication
    entity :customer_access,
      type: Boxzooka::CustomerAccess

    def version
      '1.5'
    end
  end
end
