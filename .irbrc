require "irb/completion"
require "yaml"

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

def y(obj)
  puts YAML.dump(obj)
end

alias q exit

# Use Wirble, if we have it.
begin
  require "rubygems"
  require "wirble"
  Wirble.init
  Wirble.colorize
rescue LoadError
  # Do nothing.
end
