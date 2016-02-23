require 'net/http'

module Boxzooka
  class FulfillmentEndpoint
    def catalog_request(request)
      request_xml   = Boxzooka.xml(request)
      response_xml  = post(request_xml)
    end

    private

    def post(request_xml)
      Net::HTTP.post(endpoint_server, endpoint_path)
    end
  end
end
