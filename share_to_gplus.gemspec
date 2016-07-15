# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "share_to_gplus/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Andrey Eremin"]
  gem.email         = ["dsoft88@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/developer88/share_to_google_plus"

  gem.rubyforge_project = "share_to_gplus"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "share_to_gplus"
  gem.require_paths = ["lib"]
  gem.version       = ShareToGplus::VERSION

  gem.add_runtime_dependency 'capybara', '>=2'
  gem.add_runtime_dependency 'selenium-webdriver'
  gem.add_runtime_dependency 'poltergeist'

end