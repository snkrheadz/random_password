# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'random_password/version'

Gem::Specification.new do |spec|
  spec.name          = 'random_password'
  spec.version       = RandomPassword::VERSION
  spec.authors       = ['akinrt']
  spec.email         = ['aki.d.sc@gmail.com']

  spec.summary       = 'Generate strong passwords'
  spec.description   = '🔑 RandomPassword is a strong password generator that help your way to generate secure password quickly.'
  spec.homepage      = 'https://github.com/akinrt/random_password'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.22.2'
end
