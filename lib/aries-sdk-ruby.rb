require "helix_runtime"

begin
  require "aries-sdk-ruby/native"
rescue LoadError
  warn "Unable to load aries-sdk-ruby/native. Please run `rake build`"
end
