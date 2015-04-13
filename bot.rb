require 'cinch'
require_relative 'np'
require_relative 'define'
require_relative 'messanger'
require_relative 'wolfram'
require_relative 'echo' 
require_relative 'seen'
require_relative 'link_info'
require_relative 'history'

bot = Cinch::Bot.new do
	configure do |c|
		c.nick = "nairobi-bot"
		c.server = "irc.freenode.net"
		c.channels = ["#nairobilug"]
    c.plugins.prefix = /^@/
		c.plugins.plugins = [Np, Wa, Echo, LinkInfo, History, Seen, Define, NpLibre]
    #		c.plugins.plugins = [Np, Messanger, Wa]
    config.plugins.options[History] = {
     :mode => :max_messages,
     :max_messages => 10,
     # :max_age => 5,
     :time_format => "%H:%M",
     :file => "/var/cache/seenlog.dat"
    }
    config.plugins.options[Seen] = {
      :file => "/tmp/seenlog.dat"
    }

	end
end

bot.start
