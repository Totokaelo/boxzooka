module Boxzooka
  # Base class for Boxzooka API response objects.
  class BaseResponse
    # CustomerId
    attr_accessor :customer_id

    # Original Request
    attr_reader :request

    # API Version
    attr_accessor :version

    def initialize(request)
      @request = request
    end
  end
end
