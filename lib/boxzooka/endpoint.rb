require 'uri'
require 'net/http'

module Boxzooka
  # Run requests, construct + return responses.
  class Endpoint
    def initialize(customer_access = nil)
      @customer_access = customer_access
    end

    # Run the request.
    def execute(request)
      request.customer_access ||= @customer_access

      request_xml     = serialize(request)
      endpoint_url    = url_for_request(request)
      response_xml    = post(endpoint_url, request_xml)

      return response_xml

      response_klass  = response_class_for_request(request)
      response        = deserialize(response_xml, response_klass)

      response
    end

    private

    # Transform a PORO Boxzooka::BaseRequest into an XML String.
    def serialize(obj)
      Boxzooka::Xml.serialize(obj)
    end

    # Transform an XML string into PORO Boxzooka::BaseResponse.
    def deserialize(xml, klass)
      Boxzooka::Xml.deserialize(xml, klass)
    end

    # Post the xml to the url. Return response body.
    def post(url, request_xml)
      uri = URI(url)

      request = Net::HTTP::Post.new(uri)
      request.body = request_xml
      # request['Content-Type'] = 'application/xml'

      response = Net::HTTP.start(
        uri.hostname,
        uri.port,
        use_ssl: uri.scheme == 'https',
        # TODO MAKE THIS UNSUCK
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      ) do |http|
        http.request(request)
      end

      response
    end

    # Return the endpoint URL for request.
    # TODO factor this out to a config object.
    def url_for_request(request)
      case request
      when CatalogRequest                 then 'https://sandbox3.boxzooka.com/productsapi'
      when ProductListRequest             then 'https://sandbox3.boxzooka.com/productlistapi'
      when InboundRequest                 then 'https://sandbox3.boxzooka.com/inboundapi'
      when InboundCancellationRequest     then 'https://sandbox3.boxzooka.com/inboundcancelapi'
      when InboundListRequest             then 'https://sandbox3.boxzooka.com/inboundlistapi'
      when InboundDiscrepancyListRequest  then 'https://sandbox3.boxzooka.com/inbounddiscrepancyapi'
      when OrdersRequest                  then 'https://sandbox3.boxzooka.com/ordersapi'
      when OrderCancellationRequest       then 'https://sandbox3.boxzooka.com/ordercancelapi'
      when OrdersListRequest              then 'https://sandbox3.boxzooka.com/orderlistapi'
      when ReturnNotificationRequest      then 'https://sandbox3.boxzooka.com/returnnotificationapi'
      else
        raise NotImplementedRequest
      end
    end

    # Return the response class for a request.
    def response_class_for_request(request)
      klass_name = request.class.name.sub('Request', 'Response')

      Kernel.const_get(klass_name)
    end
  end
end

