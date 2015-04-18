ENV["TEST"] = "true"
ENV["AUTOLOAD_SPROCKETS"] = "false"

require 'simplecov'
SimpleCov.start do
  add_filter "/features/"
end

require 'pry-byebug'
require 'dotenv'
Dotenv.load
#binding.pry

require 'coveralls'

Coveralls.wear!


PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))
require 'middleman-core'
require 'middleman-core/step_definitions'
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-amazon-link')


