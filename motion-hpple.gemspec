# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hpple/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Francis Chong"]
  gem.email         = ["francis@ignition.hk"]
  gem.description   = "A XML/HTML parser for RubyMotion, with nokogiri style interface."
  gem.summary       = "A XML/HTML parser for RubyMotion, with nokogiri style interface."
  gem.homepage      = "https://github.com/siuying/hpple-motion"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-hpple"
  gem.require_paths = ["lib"]
  gem.version       = Hpple::VERSION
end
