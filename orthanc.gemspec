# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orthanc/version'

Gem::Specification.new do |spec|
  spec.name          = "orthanc"
  spec.version       = Orthanc::VERSION
  spec.authors       = ["Simon Rascovsky"]
  spec.email         = ["simonmd@gmail.com"]

  spec.summary       = "Client for the Orthanc DICOM server API"
  spec.description   = "Client for the Orthanc DICOM server REST API"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"


  spec.add_dependency 'rest-client', "~> 1.8"
  spec.add_dependency 'recursive-open-struct', "~> 0.6.3"
  spec.add_dependency 'plissken', "~> 0.2.0"
end
