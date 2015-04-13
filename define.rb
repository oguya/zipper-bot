require 'cinch'
require 'open-uri'
require 'json'

# API GUIDE 101!
# http://api.duckduckgo.com/?q=#{b}&format=json&pretty=1
# where b = word to define
# For example: define the word 'loci'
# http://api.duckduckgo.com/?q=loci&format=json&pretty=1

class Define
  include Cinch::Plugin

  match /define\ ?(.*)/ 

  def execute(m, query)

    if is_single_word(query)
      b = query
    else
      b = query.split.join("+")
    end

    parsedJSON = open("http://api.duckduckgo.com/?q=#{b}&format=json") { |f| JSON.parse f.read }
    definitions = parsedJSON["RelatedTopics"][0]

    
    m.reply "#{definitions["Text"]} Link: #{definitions["FirstURL"]}"
  end

  def is_single_word(string)
    string.strip == string and string.include?(" ")
  end
  
end
