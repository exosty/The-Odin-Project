sum = 0
for number in 0..999
	if ((number%3)==0 or (number%5)==0)
		sum=sum+number
	end
end
puts sum