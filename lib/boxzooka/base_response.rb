module Boxzooka
  # Base class for Boxzooka API response objects.
  class BaseResponse < BaseElement
    # CustomerId.
    scalar :customer_id

    # Original Request.
    attr_accessor :request

    # Source XML from webservice.
    attr_accessor :xml

    # API Version.
    scalar :version
  end
end
