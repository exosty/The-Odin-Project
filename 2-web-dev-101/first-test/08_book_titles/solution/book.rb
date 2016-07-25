class Book
	attr_reader :title
	def title= name
		little_words = ['a', 'an', 'the', 'and', 'or', 'of', 'to', 'from', 'in', 'at']
		words = name.split
		words.each do |word|
			unless little_words.include?(word)
				word.capitalize!	
			end
		end
		
		words[0].capitalize!
		@title=words.join(' ')
	end

end
