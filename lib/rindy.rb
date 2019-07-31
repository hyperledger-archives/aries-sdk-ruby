require "helix_runtime"

begin
  require "rindy/native"
rescue LoadError
  warn "Unable to load rindy/native. Please run `rake build`"
end
