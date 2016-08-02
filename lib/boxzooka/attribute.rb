require 'boxzooka/base_element'

module Boxzooka
  # Generic Key/Value pair.
  class Attribute < BaseElement
    scalar :name
    scalar :value
  end
end
