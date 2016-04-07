require 'uri'
require 'net/http'
require 'logger'

require 'boxzooka/endpoint_urls'

module Boxzooka
  # Run requests, construct + return responses.
  class Endpoint
    Error = Class.new(StandardError)

    def initialize(customer_id:, customer_key:, hostname:, debug: false, logger: nil)
      @customer_access = Boxzooka::CustomerAccess.new(customer_id: customer_id, customer_key: customer_key)
      @urls = Boxzooka::EndpointUrls.new(hostname)
      @debug = debug
      @logger = logger || Logger.new(STDOUT)
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
        @logger.debug "REQUEST\tPOST #{endpoint_url} XML"
        @logger.debug request_xml

        @logger.debug "RESPONSE\t#{http_response.code} XML"
        @logger.debug response_xml
      end

      response_klass = response_class_for_request(request)

      if http_response.code.to_i != 200
        failure_message = "POST #{endpoint_url} Failed with #{http_response.code}"

        if http_response.body && http_response.body.length > 0
          failure_message += " \"#{http_response.body}\""
        end

        raise Error.new(failure_message)
      end

      response = deserialize(response_xml, response_klass)
      response.assign_http_variables(request, http_response, response_xml)

      response
    end

    # Return the endpoint URL for request.
    def url_for_request(request)
      url = @urls.url_for_request(request)

      if url
        url
      else
        raise "No Response Class for #{simple_class_name} (did you forget to update URLs?)"
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

