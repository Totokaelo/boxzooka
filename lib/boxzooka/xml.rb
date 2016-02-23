module Boxzooka
  module Xml
    def self.serialize(obj)
      case obj
      when CatalogRequest then Xml::CatalogRequestXml.new(obj).xml
      when CustomerAccess then self.customer_access_xml(obj)
      when Item           then Xml::ItemXml.new(obj).xml
      else raise NotImplementedError
      end
    end

    private

    def self.customer_access_xml(customer_access)
      b = Builder::XmlMarkup.new

      b.CustomerAccess do
        b.CustomerId customer_access.customer_id
        b.CustomerKey customer_access.customer_key
      end
    end
  end
end
