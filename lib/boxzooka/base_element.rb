module Boxzooka
  class BaseElement
    module FieldTypes
      TEXT = :text
      ENTITY = :entity
      COLLECTION = :collection
    end

    class << self
      def field_names
        fields.keys
      end

      def field_type(field_name)
        field_options(field_name)[:field_type]
      end

      def field_options(field_name)
        fields.fetch(field_name)
      end

      # Define a plain-jane text field.
      def field(key, options = {})
        define_field(key, options.merge(field_type: FieldTypes::TEXT))
      end

      # Define a complex entity.
      # +key+: name of the entity.
      # +options+
      #   :type - expected class of the entity
      def entity(key, options = {})
        validate_options(options, :type)
        define_field(key, options.merge(field_type: FieldTypes::ENTITY))
      end

      # Define a collection.
      # +key+: name of the entity.
      # +options+
      #   :entry_type       - expected class of the Array entries.
      #   :entry_node_name  - node name to be applied to Array entries.
      #   :flat             - when true, a container node will not be written.
      def collection(key, options = {})
        validate_options(options, :entry_type, :entry_node_name)
        define_field(key, options.merge(field_type: FieldTypes::COLLECTION))
      end

      private

      def fields
        @fields ||= {}
      end

      def define_field(field_name, options)
        fields[field_name] = options

        # Define Reader
        attr_reader field_name

        # Define Writers
        attr_writer field_name
      end

      def validate_options(options, *keys)
        keys.each do |key|
          unless options.has_key?(key)
            raise ArgumentError.new("#{key} required")
          end
        end
      end
    end

    def initialize(hash = {})
      self.class.field_names.each do |field_name|
        field_name_s = field_name.to_s
        field_name_sym = field_name_s.intern

        # If for some reason you are passing both :sym and 'sym', this will blow up.
        hash_value = hash[field_name_s] || hash[field_name_sym]

        instance_variable_set("@#{field_name}", hash_value)
      end
    end
  end
end
