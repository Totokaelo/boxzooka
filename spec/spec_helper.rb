require 'boxzooka'
require 'factory_girl'
require 'boxzooka_spec_helper'
require 'rspec/its'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.color = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Include FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
  FactoryGirl.find_definitions

  # Include useful helpers
  config.include BoxzookaSpecHelper
end

