module Boxzooka
  module Xml
    # Common methods for Serialization/Deserialization
    module SerializationHelper
      FieldTypes = Boxzooka::BaseElement::FieldTypes
      ScalarTypes = Boxzooka::BaseElement::ScalarTypes

      # In the case of Collection, entry field type.
      def entry_field_type(field_name)
         field_options(field_name).fetch(:entry_field_type)
      end

      # In the case of Collection, what to name the entries.
      def entry_node_name(field_name)
        field_options(field_name).fetch(:entry_node_name)
      end

      # In the case of Collection, specific field type.
      def entry_type(field_name)
         field_options(field_name).fetch(:entry_type)
      end

      def field_class(field_name)
        field_options(field_name).fetch(:type)
      end

      def field_node_name(field_name)
        Boxzooka::StringUtils.camelize(field_name)
      end

      def node_field_name(node_name)
        Boxzooka::StringUtils.snaketize(node_name).intern
      end

      def field_options(field_name)
        klass.field_options(field_name)
      end

      def field_type(field_name)
        klass.field_type(field_name)
      end

      def flat_collection?(field_name)
        field_options(field_name).fetch(:flat, false)
      end

      def field_exists?(field_name)
        klass.field_names.include?(field_name)
      end

      def scalar_fields
        klass.fields_by_type[FieldTypes::SCALAR]
      end

      def entity_fields
        klass.fields_by_type[FieldTypes::ENTITY]
      end

      def collection_fields
        klass.fields_by_type[FieldTypes::COLLECTION]
      end
    end
  end
end
