# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'rindy'
  s.version      = '0.0.11'
  s.authors      = ['John Callahan']
  s.summary      = "A Helix project"
  s.files        = Dir['{lib/**/*,[A-Z]*}']

  s.platform     = Gem::Platform::RUBY
  s.extensions   = %w[extconf.rb]
  s.require_path = 'lib'

  s.add_dependency 'helix_runtime', '~> 0.7.5'
end
