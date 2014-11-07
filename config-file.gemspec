# -*- encoding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/lib/config_file/version')

Gem::Specification.new do |spec|
  spec.name          = "config-file"
  spec.summary       = %q{Simple library for reading configuration from different sources.}
  spec.description   = %q{Description: Simple library for reading configuration from different sources.}
  spec.email         = "alexander.shvets@gmail.com"
  spec.authors       = ["Alexander Shvets"]
  spec.homepage      = "http://github.com/shvets/config_file"

  spec.files         = `git ls-files`.split($\)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version       = ConfigFile::VERSION
  spec.license       = "MIT"

  
  spec.add_runtime_dependency "meta_methods", [">= 0"]
  spec.add_runtime_dependency "json", [">= 0"]
  spec.add_development_dependency "gemspec_deps_gen", [">= 0"]
  spec.add_development_dependency "gemcutter", [">= 0"]

end

