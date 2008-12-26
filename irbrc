require "irb/completion"
require "rubygems"
require "wirble"
require "yaml"

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

def y(obj)
  puts YAML.dump(obj)
end

alias q exit

Wirble.init
Wirble.colorize
