module Boxzooka
  module StringUtils
    # snake_case -> CamelCase
    def self.camelize(arg)
      arg.
        to_s.
        split('_').
        map(&:capitalize).
        join('')
    end

    # CamelCase -> snake_case
    def self.snaketize(arg)
      arg.
        to_s.
        scan(/[A-Z][a-z]+/).
        map(&:downcase).
        join('_')
    end
  end
end
