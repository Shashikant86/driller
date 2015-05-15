# coding: utf-8
lib = File.expand_path('./lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require_relative './lib/driller/version'

Gem::Specification.new do |spec|
  spec.name          = "driller"
  spec.version       = "0.9"
  spec.authors       = ["Shashikant86"]
  spec.email         = ["shashikant.jagtap@aol.co.uk"]
  spec.summary       = %q{Drill your website for error and slow pages}
  spec.description   = %q{Driller is a command line Ruby based web crawler based on Anemone. Driller can crawl website and reports error pages which are not 200 or 301.}
  spec.homepage      = "https://github.com/Shashikant86/driller"
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^lib/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency "bundler", "~> 1.0"
  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "anemone"
end
