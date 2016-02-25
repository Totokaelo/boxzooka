module Boxzooka
  module Xml
    # Serializes an object.
    # +obj+: the object to serialize.
    # +node_name+: optional override for the base node name.
    def self.serialize(obj, node_name: nil)
      case obj
      when CatalogRequest   then Xml::CatalogRequestXml.new(obj).xml
      when Item             then Xml::ItemXml.new(obj).xml

      # This comes last to allow overrides above.
      when BaseElement      then Xml::Serializer.new(obj, node_name: node_name).xml

      else raise NotImplementedError.new("Cannot serialize #{obj.class}")
      end
    end

    def self.deserialize(xml, klass)
      case klass.new
      when CatalogResponse  then Xml::DeserializeCatalogResponse.new(xml).object

      # This comes last to allow overrides above.
      when BaseElement      then Xml::Deserializer.new(xml, klass).object

      else raise NotImplementedError.new("Cannot deserialize #{klass}")
      end
    end
  end
end
