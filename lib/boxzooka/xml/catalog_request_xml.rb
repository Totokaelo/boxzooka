require 'builder'

module Boxzooka
  module Xml
    class CatalogRequestXml
      attr_reader :xml

      def initialize(request)
        @request = request
        @builder = Builder::XmlMarkup.new
        @xml = build_xml
      end

      private

      attr_reader :request, :builder

      def customer_access
        request.customer_access
      end

      def build_xml
        builder.CatalogRequest do
          Boxzooka::Xml.serialize(customer_access)

          builder.Version @request.version
          builder.Items do
            request.items.each do |item|
              builder << Boxzooka::Xml.serialize(item)
            end
          end
        end

        builder.target!
      end
    end
  end
end
