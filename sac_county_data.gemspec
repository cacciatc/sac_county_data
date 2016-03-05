# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sac_county_data/version'

Gem::Specification.new do |spec|
  spec.name          = 'sac_county_data'
  spec.version       = SacCountyData::VERSION
  spec.authors       = ['Chris Cacciatore']
  spec.email         = ['chris.cacciatore@gmail.com']
  spec.summary       = 'A Ruby interface for the Sac County Open Data portal.'
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.34'
  spec.add_development_dependency 'minitest', '~> 5.8'

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'json', '~> 1.8'
end
