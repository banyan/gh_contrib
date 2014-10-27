# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gh_contrib/version'

Gem::Specification.new do |spec|
  spec.name          = "gh_contrib"
  spec.version       = GhContrib::VERSION
  spec.authors       = ["Kohei Hasegawa"]
  spec.email         = ["ameutau@gmail.com"]
  spec.summary       = %q{Show contributions of GitHub.}
  spec.description   = %q{Show contributions of GitHub.}
  spec.homepage      = "https://github.com/banyan/gh_contrib"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "commander"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "mechanize"
  spec.add_runtime_dependency "dotenv"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
