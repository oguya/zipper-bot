require 'cinch'

class Messanger
	include Cinch::Plugin

	listen_to :join, method: :message

	def message(m)
		if m.user.nick == "njerichelimo"
			m.reply "#{m.user.nick} zipper couldn't be here so he told me to tell you that he said hey."
	        end
	end

end

bot = Cinch::Bot.new do
	configure do |c|
		c.nick = "zipper|bot"
		c.server = "irc.freenode.net"
		c.channels = ["#nairobilug"]
		c.plugins.plugins = [Messanger]
	end
end

bot.start
