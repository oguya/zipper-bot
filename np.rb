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


    m.reply "#{b} is listening to \"#{we["track"]["name"]}\" by #{we["track"]["artist"]["name"]}"



  end
end

