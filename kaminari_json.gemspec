# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaminari_json/version'

Gem::Specification.new do |spec|
  spec.name          = "kaminari_json"
  spec.version       = KaminariJSON::VERSION
  spec.authors       = ["Chris Lamb", "Jeremy Frens"]
  spec.email         = ["chris.lamb@centro.net"]
  spec.description   = %q{Provides kaminari pagination info for json responses.}
  spec.summary       = %q{Provides kaminari pagination info for json responses.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "kaminari", "0.14.1"
  spec.add_dependency "active_model_serializers"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", "~> 3.2.12"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "geminabox"
  spec.add_development_dependency "bundler", "~> 1.3.0"
end
