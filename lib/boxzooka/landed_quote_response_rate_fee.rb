require 'boxzooka/base_element'

module Boxzooka
  class LandedQuoteResponseRateFee < BaseElement
    scalar :description
    scalar :charge, type: :decimal
  end
end
