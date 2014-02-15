require 'cinch'
require 'wolfram'

 
class Wa
  include Cinch::Plugin

 
  match /wa (.+)/
 
 
  def execute(m, query)

    Wolfram.appid = "6TJA3R-PQ9AP7W8UP"

    

    unrefinedResult = Wolfram.fetch(query) 

    refinedResult = unrefinedResult.pods[1]

    afterRegex = /.+/.match refinedResult.to_s

    finalResult = afterRegex.to_s

    m.reply(finalResult, true)

  end
end
