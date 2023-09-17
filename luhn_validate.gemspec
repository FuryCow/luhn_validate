# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'luhn_validate'
  s.version     = '0.1.2'
  s.summary     = 'Luhn Validate'
  s.description = 'Validate Card PAN by Luhn algorithm'
  s.authors     = ['FuryCow']
  s.email       = 'dreamweaver0408@gmail.com'
  s.files       = ['lib/luhn_validate.rb']
  s.homepage    =
    'https://rubygems.org/gems/luhn_validate'
  s.license = 'MIT'
  s.add_development_dependency 'rspec'
end
