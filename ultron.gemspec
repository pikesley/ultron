# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ultron/version'

Gem::Specification.new do |spec|
  spec.name          = 'ultron'
  spec.version       = Ultron::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['github@orgraphone.org']
  spec.summary       = %q{Ruby bindings for the Marvel COmics API}
  spec.description   = %q{MADE FROM ADAMANTIUM}
  spec.homepage      = 'http://pikesley.github.io/ultron/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'curb', '~> 0.8'
  spec.add_dependency 'dotenv', '~> 0.9'
  spec.add_dependency 'activesupport', '~> 4.0'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rspec-mocks', '~> 2.14'
  spec.add_development_dependency 'rspec-pride', '~> 2.3'
  spec.add_development_dependency 'cucumber', '~> 1.3'
  spec.add_development_dependency 'guard', '~> 2.4'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
  spec.add_development_dependency 'guard-cucumber', '~> 1.4'
  spec.add_development_dependency 'terminal-notifier-guard', '~> 1.5'
  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'webmock', '~> 1.17'
  spec.add_development_dependency 'vcr', '~> 2.8'
  spec.add_development_dependency 'timecop', '~> 0.7'
end
