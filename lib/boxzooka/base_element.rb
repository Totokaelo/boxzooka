module Boxzooka
  class BaseElement
    class << self
      def field_names
        @field_names ||= []
      end

      def field(key, *args)
        # Add Field Name
        field_names << key

        # Define Reader
        attr_reader key

        # Define Writers
        attr_writer key
      end
    end

    def initialize(hash = {})
      self.class.field_names.each do |field_name|
        field_name_s = field_name.to_s
        field_name_sym = field_name_s.intern

        # If for some reason you are passing both :sym and 'sym',
        # this will blow up.
        hash_value = hash[field_name_s] || hash[field_name_sym]

        instance_variable_set("@#{field_name}", hash_value)
      end
    end
  end
end
