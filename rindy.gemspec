# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'rindy'
  s.version      = '0.0.2'
  s.authors      = ['John Callahan']
  s.summary      = "A Helix project"
  s.files        = Dir['{lib/**/*,[A-Z]*}']

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'

  s.add_dependency 'helix_runtime', '~> 0.7.5'
end
