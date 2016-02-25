module Boxzooka
  # Base class for Boxzooka API response objects.
  class BaseResponse < BaseElement
    # CustomerId
    scalar :customer_id

    # Original Request
    attr_reader :request

    # API Version
    scalar :version

    def initialize(request = nil)
      @request = request
    end
  end
end
