require 'uri'
require 'net/http'

module Boxzooka
  # Run requests, construct + return responses.
  class Endpoint
    def initialize(customer_id:, customer_key:, debug: false)
      @customer_access = Boxzooka::CustomerAccess.new(customer_id: customer_id, customer_key: customer_key)
      @debug = debug
    end

    # Run the request.
    def execute(request)
      request.customer_access ||= @customer_access

      request_xml       = serialize(request)
      endpoint_url      = url_for_request(request)
      http_response     = post(endpoint_url, request_xml)

      response_xml      = http_response.
                          body.
                          sub("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n", '')

      if @debug
        puts "RESPONSE XML"
        puts response_xml
      end

      response_klass    = response_class_for_request(request)
      response          = deserialize(response_xml, response_klass)

      response.request  = request
      response.xml      = response_xml

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
      when InventoryListRequest           then 'https://sandbox3.boxzooka.com/inventorylistapi'
      when OrdersRequest                  then 'https://sandbox3.boxzooka.com/ordersapi'
      when OrderCancellationRequest       then 'https://sandbox3.boxzooka.com/ordercancelapi'
      when OrdersListRequest              then 'https://sandbox3.boxzooka.com/orderlistapi'
      when ReturnNotificationRequest      then 'https://sandbox3.boxzooka.com/returnnotificationapi'
      else
        raise NotImplementedRequest "No Response Class for #{request.class.name}"
      end
    end

    # Transform a PORO Boxzooka::BaseRequest into an XML String.
    def serialize(obj)
      Boxzooka::Xml.serialize(obj)
    end

    # Transform an XML string into PORO Boxzooka::BaseResponse.
    def deserialize(xml, klass)
      Boxzooka::Xml.deserialize(xml, klass)
    end

    private

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

    # Return the response class for a request.
    def response_class_for_request(request)
      klass_name = request.class.name.sub('Request', 'Response')

      Kernel.const_get(klass_name)
    end
  end
end

