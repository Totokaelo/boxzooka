require 'net/http'

module Boxzooka
  class FulfillmentEndpoint
    def catalog_request(request)
      request_xml   = serialize(request)
      response_xml  = post(request_xml)
      response      = deserialize(response_xml, CatalogResponse)

      response
    end

    private

    def serialize(obj)
      Boxzooka::Xml.serialize(obj)
    end

    def deserialize(xml, klass)
      Boxzooka::Xml.deserialize(xml, klass)
    end

    def post(request_xml)
      Net::HTTP.post(endpoint_server, endpoint_path)
    end
  end
end
