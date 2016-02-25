require 'boxzooka/xml/deserializer'
require 'boxzooka/xml/serializer'

module Boxzooka
  module Xml
    # Serializes an object.
    # +obj+: the object to serialize.
    # +node_name+: optional override for the base node name.
    def self.serialize(obj, node_name: nil)
      case obj
      # This comes last to allow overrides above.
      when BaseElement      then Xml::Serializer.new(obj, node_name: node_name).xml

      else raise NotImplementedError.new("Cannot serialize #{obj.class}")
      end
    end

    def self.deserialize(xml, klass)
      case klass.new
      # This comes last to allow overrides above.
      when BaseElement      then Xml::Deserializer.new(xml, klass).object

      else raise NotImplementedError.new("Cannot deserialize #{klass}")
      end
    end
  end
end
