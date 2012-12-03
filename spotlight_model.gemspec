# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spotlight_model/version'

Gem::Specification.new do |gem|
  gem.name          = "spotlight_model"
  gem.version       = SpotlightModel::VERSION
  gem.authors       = ["nbqx"]
  gem.email         = ["nbqxnbq@gmail.com"]
  gem.description   = %q{using spotlight from ruby like activerecord}
  gem.summary       = %q{using spotlight from ruby like activerecord}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('spotlight', ['>= 0.0.6'])
  
  gem.add_development_dependency('guard')
  gem.add_development_dependency('guard-rspec')
  gem.add_development_dependency('growl')
end
