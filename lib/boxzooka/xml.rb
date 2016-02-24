module Boxzooka
  module Xml
    def self.serialize(obj)
      case obj
      when CatalogRequest then Xml::CatalogRequestXml.new(obj).xml
      when Item           then Xml::ItemXml.new(obj).xml

      # This comes last to allow overrides above.
      when BaseElement    then Xml::Serializer.new(obj).xml

      else raise NotImplementedError.new("Cannot serialize #{obj.class}")
      end
    end

    def self.deserialize(xml, klass)
      case klass.new

      # This comes last to allow overrides above.
      when BaseElement    then Xml::Deserializer.new(xml, klass).object

      else raise NotImplementedError.new("Cannot deserialize #{klass}")
      end
    end
  end
end
