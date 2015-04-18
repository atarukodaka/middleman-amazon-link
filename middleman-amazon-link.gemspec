# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-amazon-link/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-amazon-link"
  spec.version       = Middleman::AmazonLink::VERSION
  spec.authors       = ["Ataru Kodaka"]
  spec.email         = ["ataru.kodaka@gmail.com"]
  spec.summary       = %q{Middleman Extention for amazon-link.}
  spec.description   = %q{helprs provided such as amazon(asin, :detail)}
  spec.homepage      = "http://github.com/atarukodaka/middleman-amazon-link"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'amazon-ecs', '~> 2.3'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "aruba", "~> 0.6"
  spec.add_development_dependency "therubyracer", "~>0.12"
  spec.add_development_dependency "pry-byebug", "~>3.1"
  spec.add_development_dependency "rb-readline", "~>0.5"
  spec.add_development_dependency "middleman-pry", "~>0.0"
  spec.add_development_dependency "dotenv", "~>0.0"
end
