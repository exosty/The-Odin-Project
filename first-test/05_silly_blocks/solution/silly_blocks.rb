def reverser
	string = yield
	words = string.split
	words.each do |word| 
		word.reverse!	
	end
	return 	words.join(' ')
end

def adder numberToAdd=1
	number = yield
	number += numberToAdd
end

def repeater number=1

	number.times do
		yield
	end

end

