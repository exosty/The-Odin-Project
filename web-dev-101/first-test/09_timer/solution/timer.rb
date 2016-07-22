class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def padded number
		if number<10 && number >= 0
			"0"+number.to_s
		else
			number.to_s
		end
	end

	def time_string
		seconds = @seconds
		minutes = 0
		hours = 0

		while seconds>=60 do
			seconds-=60
			minutes+=1
		end
		
		while minutes>=60 do
			minutes-=60
			hours+=1
		end
	
		padded(hours) + ":" + padded(minutes) + ":" + padded(seconds)
	
	end

end
