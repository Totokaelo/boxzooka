require 'ox'

module Boxzooka
  module Xml
    # Deserializes +xml+ to an instance of +klass+.
    # +xml+ fragment to deserialize.
    # +klass+ descendant class of BaseElement.
    class Deserializer
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

      def build_object
        node_names_to_values = root_node.nodes.flat_map do |node|
          [
            Boxzooka::StringUtils.snaketize(node.value),
            node.text
          ]
        end

        raw_hash = Hash[*node_names_to_values]

        klass.new(raw_hash)
      end
    end
  end
end
