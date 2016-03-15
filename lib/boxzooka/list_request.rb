require 'boxzooka/base_request'
require 'boxzooka/list_filter'

module Boxzooka
  # Base class for list requests.
  class ListRequest < BaseRequest
    class << self
      # Define a new filter.
      # +filter_name+: name of the filter.
      # +options+
      #   :node_name: - node name for entity. Defaults to camelcase'd field_name
      def filter(filter_name, options = {})
        if filters.include?(filter_name)
          raise ArgumentError.new("Filter \"#{filter_name}\" already defined on #{self.class.name}")
        end

        filters[filter_name] = options
      end

      # Create a ListRequest with filters.
      def new_with_filters(options)
        filters_hash = options[:filters]

        # Complain if there are any unknown keys.
        unknown_keys = filters_hash.keys.reject { |key| filters.has_key?(key) }

        if unknown_keys.any?
          complaint_string =  "Could not create #{self.class.name} with unknown filter names " \
                              "(#{unknown_keys.join(', ')}). " \
                              "Available options: (#{filters.keys.join(', ')})"

          raise ArgumentError.new(complaint_string)
        end

        # Build up the ListFilter Array.
        filters_array = filters_hash.map do |filter_name, filter_value|
          # TODO: we shouldn't do this here (conversion should really only happen on the way out)
          # but I'm not sure where else to put it.
          filter_options = filters[filter_name]

          ListFilter.new(
            filter_type:  filter_options[:node_name] || Boxzooka::StringUtils.camelize(filter_name),
            filter_value: filter_value
          )
        end

        # Construct the ListRequest
        new(options.merge(filters: filters_array))
      end

      private

      def filters
        @filters ||= {}
      end
    end

    collection :filters,
      flat: true,
      entry_node_name: 'Filter',
      entry_field_type: :entity,
      entry_type: ListFilter

    # AND / OR
    # Defaults to AND.
    scalar :filter_logic

    # Field to order by.
    scalar :order_by

    # Direction of order. ASC or DESC.
    scalar :sort

    scalar :skip_count, type: :integer
  end
end
