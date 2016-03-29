prev = 1
prevprev  = 0
current = prev+prevprev
sum =0
while current<4000000 do
	prevprev= prev
	prev = current
	current = prev+prevprev
	if current%2==0
		sum+=current
	end
end
puts sum