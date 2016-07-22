def add first, second
	first+second
end

def subtract first, second
	first-second
end

def sum array
	if array.empty? 
		0
	else
		array.inject(:+)
	end
end

def multiply array
	if array.empty?
		0
	else
		array.inject(:*)
	end
end

def power first, second
	if first>second
		first
	else
		second
	end
end

def factorial number
	if number==0
		0
	else
		(1..number).inject(:*)
	end
end





