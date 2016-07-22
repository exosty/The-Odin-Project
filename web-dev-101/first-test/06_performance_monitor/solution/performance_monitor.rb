def measure number=1
	start = Time.now
	number.times do 
		yield
	end
	finish = Time.now
	if number>1	
		average = ((finish - start)/number)*0.1*10
	else
		diff = finish - start		
	end

end
