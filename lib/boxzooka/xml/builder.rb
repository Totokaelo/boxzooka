module Boxzooka
  module Xml
    class Builder
      def initialize(request)
        @request = request
      end

      def xml
        raise NotImplementedError.new
      end
    end
  end
end
