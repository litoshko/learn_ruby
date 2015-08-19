def add(x,y)
	x+y
end
def subtract(x,y)
	x-y
end
def sum(array)
	array.inject(0){|sum,element| sum+=element}
end
def multiply(a,b,*args)
	multi = a*b
	if !args.nil?
		args.each{|elem| multi*=elem}
	end
	multi
end
def power(base, power)
	base**power
end
def factorial(number)
	factor = 1
	number.times{|i| factor*=i+1}
	factor
end