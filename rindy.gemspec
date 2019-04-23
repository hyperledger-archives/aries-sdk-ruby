# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'rindy'
  s.version      = '0.0.13'
  s.authors      = ['John Callahan']
  s.summary      = "Ruby wrapper for indy-sdk"
  s.files        = `git ls-files -z`.split("\x0")

  s.platform     = Gem::Platform::RUBY
  s.extensions   = %w[extconf.rb]
  s.require_path = 'lib'
  s.licenses	 = [ 'MIT', 'Apache-2.0' ]

  s.add_dependency 'helix_runtime', '~> 0.7.5'
end
