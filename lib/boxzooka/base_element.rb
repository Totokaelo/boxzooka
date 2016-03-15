module Boxzooka
  # BaseElement allows us to declare a variable and serialization rules in one fell swoop!
  #
  # class MyClass < BaseElement
  #   root node_name: 'MyClassNode'
  #
  #   scalar :my_string
  #   scalar :my_integer, type: :integer
  #   scalar :my_decimal, type: :decimal
  #   scalar :my_datetime, type: :datetime
  #
  #   entity :my_class, type: YourClass
  #
  #   collection :integers,
  #     flat: true,
  #     entry_node_name: 'Integer',
  #     entry_field_type: :scalar,
  #     entry_type: :integer
  # end
  #
  class BaseElement
    module ScalarTypes
      DATETIME  = :datetime
      DECIMAL   = :decimal
      INTEGER   = :integer
      STRING    = :string

      ALL = [DATETIME, DECIMAL, INTEGER, STRING]
    end

    module FieldTypes
      SCALAR = :scalar
      ENTITY = :entity
      COLLECTION = :collection

      ALL = [FieldTypes::SCALAR, FieldTypes::ENTITY, FieldTypes::COLLECTION]
    end

    class << self
      # Cast a scalar argument from incoming String to whatever type.
      def cast_scalar(arg, scalar_type)
        if arg
          case scalar_type
            when ScalarTypes::DATETIME  then DateTime.parse(arg.to_s)
            when ScalarTypes::DECIMAL   then arg.to_f
            when ScalarTypes::INTEGER   then arg.to_i
            else arg
          end
        end
      end

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

      # Serialization options for root node.
      # +options+:
      #   :node_name  - node name for entity. Defaults to camelcase'd field_name
      def root(options)
        @root_options = options
      end

      # Root node name.
      def root_node_name
        if @root_options
          @root_options.fetch(:node_name)
        else
          self.name.split('::').last
        end
      end

      # Define a scalar.
      # +key+: name of the entity.
      # +options+:
      #   :type       - :integer, :decimal, :string
      #   :node_name  - node name for entity. Defaults to camelcase'd field_name
      def scalar(key, opts = {})
        defaults                  = { type: ScalarTypes::STRING }
        options_before_overrides  = defaults.merge(opts)
        options                   = options_before_overrides.merge(field_type: FieldTypes::SCALAR)

        unless ScalarTypes::ALL.include?(options[:type])
          raise ArgumentError.new("Invalid :type - #{options[:type]}. Valid options: #{ScalarTypes::ALL.map { |s| ":#{s}" }.join(', ')}")
        end

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
        validate_options(options, :entry_field_type, :entry_node_name)

        unless options[:entry_field_type] == FieldTypes::SCALAR
          validate_options(options, :entry_type)
        end

        define_field(key, options.merge(field_type: FieldTypes::COLLECTION))
      end

      protected

      def fields
        if @fields.nil?
          @fields = if defined?(superclass.fields)
                      # Run up the inheritance tree and return any fields.
                      superclass.fields.clone
                    else
                      {}
                    end
        end

        @fields
      end

      private

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
            raise ArgumentError.new("#{key} required for #{self.name}")
          end
        end
      end
    end

    # Instance Methods

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
