# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sprockets/assistant/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Bintz"]
  gem.email         = ["john@coswellproductions.com"]
  gem.description   = %q{A modern replacement for Sprockets::Secretary.}
  gem.summary       = %q{A modern replacement for Sprockets::Secretary.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sprockets-assistant"
  gem.require_paths = ["lib"]
  gem.version       = Sprockets::Assistant::VERSION

  gem.add_dependency 'thor'
  gem.add_dependency 'sinatra'
  gem.add_dependency 'sinatra-sprockets-ext'
  gem.add_dependency 'coffee-script'
  gem.add_dependency 'sass'
  gem.add_dependency 'compass'
  gem.add_dependency 'sprockets-vendor_gems'
  gem.add_dependency 'sprockets-sass'
  gem.add_dependency 'yui-compressor'
end

