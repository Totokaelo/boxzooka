require 'boxzooka/base_element'

module Boxzooka
  class LandedQuoteRequestItem < BaseElement
    scalar :sku
    scalar :quantity, type: :integer
  end
end
