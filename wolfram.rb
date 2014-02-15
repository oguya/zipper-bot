require 'cinch'
require 'wolfram'
require 'cgi'
 
class Wa
  include Cinch::Plugin

 
  match /wa (.+)/
 
 
  def execute(m, query)

    Wolfram.appid = "6TJA3R-PQ9AP7W8UP"

    

    unrefinedResult = Wolfram.fetch(query) 

    refinedResult = unrefinedResult.pods[1].to_s

    m.reply(refinedResult, true)

  end
end
