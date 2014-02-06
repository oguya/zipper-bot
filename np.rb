require 'cinch'
require 'open-uri'
require 'json'


class Np
  include Cinch::Plugin

  match /np\ ?(.*)/ 
            
  def execute(m, nick)

    if nick.strip.empty?
      b = m.user.nick
    else
      b = nick
    end

    we = open("http://ajax.last.fm/user/#{b}/now") { |f| JSON.parse f.read }


    m.reply " #{b} is listening to #{we["track"]["name"]} by #{we["track"]["artist"]["name"]} "



  end
end

bot = Cinch::Bot.new do
	configure do |c|
		c.nick = "zipper|bot"
		c.server = "irc.freenode.net"
		c.channels = ["#zippy"]
    c.plugins.prefix = /^@/
		c.plugins.plugins = [Np]
	end
end

bot.start
