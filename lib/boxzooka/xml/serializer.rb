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
          serialize_field_and_add_to_node(field_name, root_node)
        end

        doc << root_node

        # Output the XML.
        Ox.dump(doc)
      end

      def field_node_name(field_name)
        Boxzooka::StringUtils.camelize(field_name)
      end

      def field_options(field_name)
        klass.field_options(field_name)
      end

      def field_type(field_name)
        klass.field_type(field_name)
      end

      def field_value(field_name)
        object.send(field_name)
      end

      def klass
        object.class
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

      def root_node_name
        klass.name.split('::').last
      end

      def serialize_field_and_add_to_node(field_name, node)
        node_name = field_node_name(field_name)
        value = field_value(field_name)

        case field_type(field_name)
        when FieldTypes::TEXT         then node << new_node(node_name, value)
        when FieldTypes::ENTITY       then node << Ox.parse(Xml.serialize(value))
        when FieldTypes::COLLECTION   then serialize_collection_and_add_to_node(field_name, node)
        else raise NotImplementedError
        end

        nil
      end

      FieldTypes = Boxzooka::BaseElement::FieldTypes

      def serialize_collection_and_add_to_node(field_name, node)
        node_name = field_node_name(field_name)
        field_options = field_options(field_name)
        serialize_to_flat = field_options[:flat]
        entry_field_type = field_options.fetch(:entry_type)

        entry_nodes = field_value(field_name).map do |entry|
          if entry_field_type == :simple
            entry_node_name = field_options.fetch(:entry_node_name)
            new_node(entry_node_name, entry.to_s)
          else
            Ox.parse(Xml.serialize(entry))
          end
        end

        if serialize_to_flat
          entry_nodes.each { |n| node << n }
        else
          collection_node = new_node(node_name)

          entry_nodes.each { |n| collection_node << n }
          node << collection_node
        end

        nil
      end
    end
  end
end
