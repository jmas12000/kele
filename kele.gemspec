# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kele/version', __FILE__)

Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = Kele::VERSION
   s.date          = '2017-03-16'
   s.summary       = 'A ruby gem to acess the bloc API'
   s.description   = 'A Ruby Gem to access the Bloc API for user, checkpoint, message, and mentor availability'
   s.authors       = ['Jeff Moore']
   s.email         = 'jmas1_2000@yahoo.com'
   s.files         = `git ls-files`.split($/)
   s.require_paths = ['lib']
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
   s.add_runtime_dependency 'json', '~> 1.8'
   s.add_development_dependency 'bundler', '~> 1.14'
   s.add_development_dependency 'rake', '~> 10.0'
   s.add_development_dependency 'rspec', '~> 3.0'
   s.add_development_dependency 'nyan-cat-formatter', '~> 1.8'
end
