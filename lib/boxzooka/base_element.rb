module Boxzooka
  class BaseElement
    module ScalarTypes
      STRING = :string
      INTEGER = :integer
      DECIMAL = :decimal
    end

    module FieldTypes
      SCALAR = :scalar
      ENTITY = :entity
      COLLECTION = :collection

      ALL = [FieldTypes::SCALAR, FieldTypes::ENTITY, FieldTypes::COLLECTION]
    end

    class << self
      # Array of all field names for model.
      def field_names
        fields.keys
      end

      # Hash of { field_type => [field, field, ...] }
      def fields_by_type
        mapped_field_types = FieldTypes::ALL.flat_map do |ft|
          [ft, field_names.find_all { |f| field_type(f) == ft }]
        end

        Hash[*mapped_field_types]
      end

      def field_type(field_name)
        field_options(field_name)[:field_type]
      end

      def field_options(field_name)
        fields.fetch(field_name)
      end

      # Define a scalar.
      # +key+: name of the entity.
      # +options+:
      #   :type - :integer, :decimal, :string
      def scalar(key, opts = {})
        defaults                  = { type: ScalarTypes::STRING }
        options_before_overrides  = defaults.merge(opts)
        options                   = options_before_overrides.merge(field_type: FieldTypes::SCALAR)

        define_field(key, options)
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
      #   :entry_field_type - FieldType::SCALAR or FieldType::ENTITY.
      #   :entry_type       - ScalarType (scalar), or expected class (entities)
      #   :entry_node_name  - node name to be applied to Array entries.
      #   :flat             - when true, a container node will not be written.
      def collection(key, options = {})
        validate_options(options, :entry_field_type, :entry_type, :entry_node_name)
        define_field(key, options.merge(field_type: FieldTypes::COLLECTION))
      end

      # Perform any cast.
      def cast_scalar(arg, scalar_type)
        if arg
          case scalar_type
            when ScalarTypes::INTEGER then arg.to_i
            when ScalarTypes::DECIMAL then arg.to_f
            else arg
          end
        end
      end

      private

      def fields
        @fields ||= {}
      end

      def define_field(field_name, options)
        fields[field_name] = options

        # Define Writer
        if options[:field_type] == FieldTypes::SCALAR
          define_method("#{field_name}=".intern) do |v|
            instance_variable_set("@#{field_name}".intern, self.class.cast_scalar(v, options[:type]))
          end
        else
          attr_writer field_name
        end

        # Reader is always a simple reader.
        attr_reader field_name
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

        # Set instance variables via accessors to grab implicit casting
        send("#{field_name}=", hash_value)
      end
    end

    def ==(rhs)
      self.class.field_names.all? do |field_name|
        self.send(field_name) == rhs.send(field_name)
      end
    end
  end
end
