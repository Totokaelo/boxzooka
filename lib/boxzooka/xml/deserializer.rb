require 'boxzooka/xml/serialization_helper'
require 'ox'

module Boxzooka
  module Xml
    # Deserializes +xml+ to an instance of +klass+.
    # +xml+ fragment to deserialize.
    # +klass+ descendant class of BaseElement.
    class Deserializer
      include Boxzooka::Xml::SerializationHelper

      def initialize(xml, klass)
        @klass = klass
        # Will raise Ox::ParseError if it cannot parse.
        #
        # TODO: wrap this in some silly exception?,
        #       or catch that exception and return nil on #object ?
        #
        @root_node = Ox.parse(xml)
      end

      # Return the parsed object, if any. May return nil if it cannot parse.
      def object
        @object ||= build_object
      end

      private

      attr_reader :root_node, :klass

      # Deserialize all entities, and add to object.
      # If a scalar is not present it will be nil.
      def add_scalar_fields_to_object(object, nodes)
        scalar_fields.each do |field_name|
          node_name = field_node_name(field_name)
          node = nodes.find { |n| n.value == node_name }

          next unless node

          if node.nodes.length > 1
            raise "Expected #{node_name} to only have 1 child"
          end

          object.send("#{field_name}=", node.text)
        end
      end

      # Deserialize all entities, and add to object.
      # If an entity is not present it will be nil.
      def add_entity_fields_to_object(object, nodes)
        entity_fields.each do |field_name|
          node_name = field_node_name(field_name)
          field_class = field_class(field_name)

          node = nodes.find { |n| n.value == node_name }
          next unless node

          entity = Xml.deserialize(Ox.dump(node), field_class)

          object.send("#{field_name}=", entity)
        end
      end

      # Deserialize all collections and add to object.
      #
      # If a collection is not present it will be added as an empty Array,
      # which differs from the other behaviors but simplifies usage later.
      def add_collection_fields_to_object(object, nodes)
        collection_fields.each do |field_name|
          node_name = field_node_name(field_name)
          entry_node_name = entry_node_name(field_name)

          entry_field_type = entry_field_type(field_name)
          entry_type = entry_type(field_name)
          serialize_to_flat = flat_collection?(field_name)

          collection_container_node = if serialize_to_flat
                                        root_node
                                      else
                                        node = nodes.find { |n| n.value == node_name }
                                      end

          entry_nodes = if collection_container_node
                          collection_container_node.nodes.find_all { |n| n.value == entry_node_name }
                        else
                          []
                        end

          array = if entry_field_type == FieldTypes::SCALAR
            entry_nodes.map { |n| cast_scalar(n.text, entry_type) }
          else
            entry_nodes.map do |n|
              Xml.deserialize(Ox.dump(n), entry_type)
            end
          end

          object.send("#{field_name}=", array)
        end
      end

      def build_object
        object = klass.new
        nodes = root_node.nodes

        add_scalar_fields_to_object(object, nodes)
        add_entity_fields_to_object(object, nodes)
        add_collection_fields_to_object(object, nodes)

        object
      end

      def cast_scalar(arg, entry_type)
        Boxzooka::BaseElement.cast_scalar(arg, entry_type)
      end
    end
  end
end
