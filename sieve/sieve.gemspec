# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sieve/version'

Gem::Specification.new do |spec|
  spec.name          = 'sieve'
  spec.version       = Sieve::VERSION
  spec.authors       = ['theSKa']
  spec.email         = ['petru.dimulescu@theska.co']
  spec.summary       = %q{Prime numbers generator}
  spec.description   = %q{Console app for generating prime numbers in a formatted table}
  spec.homepage      = 'http://github.com/theSKa/challenges/sieve'
  spec.license       = 'WTFPL'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
