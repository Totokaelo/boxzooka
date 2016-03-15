module Boxzooka
  # Base class for Boxzooka API response objects.
  class BaseResponse < BaseElement
    # CustomerId.
    scalar :customer_id

    # Original Boxzooka Request.
    attr_reader :request

    # The HTTP Response.
    attr_reader :http_response

    # Source XML from webservice.
    attr_reader :xml

    # API Version.
    scalar :version

    # Assign some readonly variables. This should only be called by the Endpoint during
    # construction of the Response.
    def assign_http_variables(request, http_response, xml)
      @request = request
      @http_response = http_response
      @xml = xml
    end
  end
end
