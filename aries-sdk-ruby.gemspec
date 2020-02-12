# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'aries-sdk-ruby'
  s.version      = '0.0.7'
  s.authors      = ['John Callahan']
  s.summary      = "Ruby wrapper for aries-sdk"
  s.files        = ["Cargo.lock", "Cargo.toml", "Gemfile", "Gemfile.lock"]
  s.files       += ["LICENSE", "README.md", "Rakefile", "aries-sdk-ruby.gemspec"]
  s.files       += ["extconf.rb", "lib/aries-sdk-ruby.rb", "lib/tasks/helix_runtime.rake"]
  s.files       += ["spec/aries-sdk-ruby_spec.rb", "spec/spec_helper.rb", "src/lib.rs"]

  s.platform     = Gem::Platform::RUBY
  s.extensions   = %w[extconf.rb]
  s.require_path = 'lib'
  s.licenses	 = [ 'Apache-2.0' ]
  s.homepage	 = 'https://github.com/hyperledger/aries-sdk-ruby'

  s.add_dependency 'helix_runtime', '~> 0.7.5'
end
