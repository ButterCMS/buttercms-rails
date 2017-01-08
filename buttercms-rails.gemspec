# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "butter/version"

Gem::Specification.new do |s|
  s.name = "buttercms-rails"
  s.version = Butter::VERSION
  s.required_ruby_version = '>= 1.9.3'
  s.require_paths = ["lib"]
  s.summary = 'A Rails gem for the buttercms.com REST API'
  s.description = 'Butter is a blogging platform loved by engineers. See https://buttercms.com for details.'
  s.authors = ["ButterCMS"]
  s.email= ["support@buttercms.com"]
  s.homepage = "https://buttercms.com/docs"
  s.license = 'MIT'

  s.add_runtime_dependency "buttercms-ruby", "~> 1.1.1"
  s.add_development_dependency "rails", ">= 3.2.0"

  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
end
