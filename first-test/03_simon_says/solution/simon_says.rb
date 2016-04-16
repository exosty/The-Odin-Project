def echo word
	word
end

def shout word
	word.upcase
end

def repeat word, times=2
	string = word
	(1..times-1).each do
		string = string + " " + word	
	end
	return string
end

def start_of_word word, length
	word[0..length-1]
end

def first_word string
	string.split(" ")[0]
end

def titleize string
	lowcase_words = ['but', 'and', 'or', 'the', 'a', 'an', 'of', 'over', 'for']
	words = string.split
	words[0].capitalize!
	words[1, words.length].each do |a| 
		unless lowcase_words.include?(a) 
			a.capitalize! 
		end
	end
	words.join(" ")
end

