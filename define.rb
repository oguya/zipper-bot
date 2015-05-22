require 'cinch'
require 'open-uri'
require 'json'
require 'uri'

# API GUIDE 101!
# http://api.duckduckgo.com/?q=#{b}&format=json&pretty=1
# where b = word to define
# For example: define the word 'loci'
# http://api.duckduckgo.com/?q=loci&format=json&pretty=1

class Define
  include Cinch::Plugin

  match /define\ ?(.*)/ 

  def execute(m, query)

    b = URI.escape(query)

    parsedJSON = open("http://api.duckduckgo.com/?q=#{b}&format=json") { |f| JSON.parse f.read }
    if parsedJSON["RelatedTopics"].length > 0
        definitions = parsedJSON["RelatedTopics"][0]

        abstractURL = parsedJSON["AbstractURL"]
        abstractText = (parsedJSON["AbstractText"].length > 0) ? parsedJSON["AbstractText"] : abstractText = definitions["Text"]
    
        m.reply "#{abstractText} Link: #{abstractURL}"
    else
        m.reply "I got nothing :( Just google it -> https://www.google.com/search?q=#{b}&ie=utf-8&oe=utf-8"
    end
  end
end
