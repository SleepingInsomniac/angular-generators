# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angular_generators/version'

Gem::Specification.new do |spec|
  spec.name          = "angular_generators"
  spec.version       = AngularGenerators::VERSION
  spec.authors       = ["Alex Clink"]
  spec.email         = ["code@alexclink.com"]

  spec.summary       = "AngularJS rails generators"
  spec.description   = "Generates AngularJS scaffolding for use with rails. The bulid process ignores the asset pipeline and uses gulp."
  spec.homepage      = "http://alexclink.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "http://gems.pixelfaucet.com"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files = [
    "lib/**/*",
    "bin/**/*",
    "README.md"
  ].map {|g| Dir.glob(g)}.flatten
  
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
