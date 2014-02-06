require 'cinch'
require_relative 'np'
require_relative 'messanger'

bot = Cinch::Bot.new do
	configure do |c|
		c.nick = "zipper|bot"
		c.server = "irc.freenode.net"
		c.channels = ["#nairobilug"]
    c.plugins.prefix = /^@/
		c.plugins.plugins = [Np, Messanger]
	end
end

bot.start
