require 'ox'

module Boxzooka
  module Xml
    # Serializes a descendant of BaseElement to XML.
    class Serializer
      def initialize(object)
        @object = object
      end

      # Serialized element.
      def xml
        @xml ||= build_xml
      end

      private

      attr_reader :object

      def build_xml
        doc = new_doc

        root_node = new_node(root_node_name)

        klass.field_names.each do |field_name|
          node_name = Boxzooka::StringUtils.camelize(field_name)
          node_value = object.send(field_name)

          root_node << new_node(node_name, node_value)
        end

        doc << root_node

        # Output the XML.
        Ox.dump(doc)
      end

      def klass
        object.class
      end

      def root_node_name
        klass.name.split('::').last
      end

      def new_doc
        Ox::Document.new(version: '1.0')
      end

      def new_node(node_name, internals = nil)
        el = Ox::Element.new(node_name)

        if internals
          el << internals
        end

        el
      end
    end
  end
end
