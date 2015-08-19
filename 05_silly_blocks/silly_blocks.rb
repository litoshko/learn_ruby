def reverser(&block)
	yield.split.map{|word| word.reverse}.join(' ')
end
def adder(number_to_add=1,&block)
	number_to_add+yield
end
def repeater(tries=1,&block)
	tries.times{yield}
end