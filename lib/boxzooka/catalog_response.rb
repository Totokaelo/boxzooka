module Boxzooka
  # Response from Boxzooka for CatalogRequest.
  class CatalogResponse < BaseResponse
    # Array of ResponseItem's
    attr_accessor :results
  end
end
