require 'cinch'

class Messanger
	include Cinch::Plugin

	listen_to :join, method: :message

	def message(m)
		if m.user.nick == "zipper"
			m.reply "#{m.user.nick} It is I your butler and may I say you look just ravishing today? The ladies will just eat you up."
	        end
	end

end
