# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'aries-sdk-ruby'
  s.version      = '0.0.1'
  s.authors      = ['John Callahan']
  s.summary      = "Ruby wrapper for aries-sdk"
  s.files        = `git ls-files -z`.split("\x0") - %w(.gitignore)

  s.platform     = Gem::Platform::RUBY
  s.extensions   = %w[extconf.rb]
  s.require_path = 'lib'
  s.licenses	 = [ 'Apache-2.0' ]
  s.homepage	 = 'https://github.com/hyperledger/aries-sdk-ruby'

  s.add_dependency 'helix_runtime', '~> 0.7.5'
end
