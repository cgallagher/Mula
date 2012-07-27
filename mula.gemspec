# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mula/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Gallagher"]
  gem.email         = ["cgallagher@gmail.com"]
  gem.description   = %q{Currency conversion made simple via the Google API}
  gem.summary       = %q{Currency conversion made simple via the Google API}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "mula"
  gem.require_paths = ["lib"]
  gem.version       = Mula::VERSION
  gem.add_dependency 'activesupport', '~> 3.2'
  gem.add_development_dependency 'rspec'
end
