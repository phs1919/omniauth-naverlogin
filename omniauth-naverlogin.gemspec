require File.expand_path("../lib/omniauth-naverlogin/version", __FILE__)

Gem::gemification.new do |gem|
  gem.name          = "omniauth-naverlogin"
  gem.version       = Omniauth::NaverLogin::VERSION
  gem.authors       = ["Richard Park"]
  gem.email         = ["richard@tumblbug.com"]
  gem.summary       = "Naver Login Strategy for Omniauth"
  gem.description   = gem.summary
  gem.homepage      = "https://github.com/tumblbug/omniauth-naverlogin"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|gem|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency "bundler", "~> 1.7"
end