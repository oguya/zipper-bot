require 'cinch'
require_relative 'np'
require_relative 'messanger'
require_relative 'wolfram'


bot = Cinch::Bot.new do
	configure do |c|
		c.nick = "zipper|bot"
		c.server = "irc.freenode.net"
		c.channels = ["#nairobilug"]
    c.plugins.prefix = /^@/
		c.plugins.plugins = [Np, Wa]
#		c.plugins.plugins = [Np, Messanger, Wa]
	end
end

bot.start
