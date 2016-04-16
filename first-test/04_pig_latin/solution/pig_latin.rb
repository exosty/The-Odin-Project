def translate string
	vowels = ['a', 'e', 'i', 'o', 'u']
	words = string.split
	words.each do |word|
		if vowels.include?(word[0]) && 
			word << 'ay'
		else
			unless vowels.include?(word[1])

				if word[1..2]=='qu'
					word << word[0..2] << 'ay'
					word[0..2]= ''				
				else

					unless vowels.include?(word[2]) 
						word << word[0..2] << 'ay'
						word[0..2]=''
					else
						word << word[0..1] << 'ay'
						word[0..1]=''
					end

				end
			else
				if word[0..1]=='qu'
					word << word[0..1] << 'ay'
					word[0..1]= ''				
				else
					word << word[0] << 'ay'
					word[0]= ''
				end
			end

		end
		
		unless word == word.downcase
			word.capitalize!
		end

	end

	return words.join(" ")

end
