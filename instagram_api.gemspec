# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'instagram_api/version'

Gem::Specification.new do |spec|
  spec.name          = "instagram_api"
  spec.version       = Instagram::VERSION
  spec.authors       = ["Casey Scarborough"]
  spec.email         = ["caseyscarborough@gmail.com"]
  spec.description   = "A wrapper for the Instagram API."
  spec.summary       = "This gem is a simple and easy-to-use wrapper for accessing data from Instagram's API."
  spec.homepage      = "https://github.com/caseyscarborough/instagram"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock", '1.11'
  spec.add_development_dependency "vcr"
  spec.add_dependency "httparty"
  spec.add_dependency "hashie"
end
