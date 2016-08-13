number = 13195
LPM = 2

while number > 1
	(2..number/2).each do |i|

		simple = 0

		(1..i/2).each do |j|
			simple+=1 if i%j==0
		end

		
		if simple<2 and number%i==0
			number = number/i
			LPM = i
		end
	end
end

puts LPM