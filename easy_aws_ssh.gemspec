# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_aws_ssh/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_aws_ssh"
  spec.version       = EasyAwsSsh::VERSION
  spec.authors       = ["Seth Ringling"]
  spec.email         = ["sethr@ritani.com"]

  spec.summary       = %q{An easier way to SSH into an AWS ec2 instance}
  spec.description   = %q{Looks up IP addresses for machines for a quick way to SSH}
  spec.homepage      = "https://github.com/NEWECX/easy_aws_ssh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['awssh']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

  spec.add_runtime_dependency 'json'
end
