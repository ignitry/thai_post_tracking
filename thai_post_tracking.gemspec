# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'thai_post_tracking/version'

Gem::Specification.new do |spec|
  spec.name          = "thai_post_tracking"
  spec.version       = ThaiPostTracking::VERSION
  spec.authors       = ["Wittawas Wisarnkanchana"]
  spec.email         = ["start@ignitry.com"]
  spec.summary       = %q{.}
  spec.description   = %q{.}
  spec.homepage      = "https://github.com/ignitry/thai_post_tracking"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.5"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", ">= 5.4"
  spec.add_dependency "httparty", ">= 0.16"
  spec.add_dependency "rest-client"
end
