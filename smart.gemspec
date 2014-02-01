# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart/version'

Gem::Specification.new do |spec|
  spec.name          = 'smart'
  spec.version       = Smart::VERSION
  spec.authors       = ['Mike Silvis']
  spec.email         = ['mikesilvis@gmail.com']
  spec.summary       = %q{Automatically opens hangouts with calendar events}
  spec.description   = %q{$$$}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'google_calendar'
  spec.add_dependency 'whenever'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'debugger'
  spec.add_development_dependency 'faraday'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'rake'
end
