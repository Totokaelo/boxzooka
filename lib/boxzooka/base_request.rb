module Boxzooka
  # Base class for Boxzooka API request objects.
  class BaseRequest
    # Authentication
    attr_accessor :customer_access

    def version
      '1.5'
    end
  end
end
