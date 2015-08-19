def ftoc(farenheit)
	if (farenheit - 32)*10 % 18 == 0
		(farenheit - 32)*10 / 18
	else 
		(farenheit - 32)/1.8
	end
end

def ctof(celsius)
	if celsius*18 % 10 == 0
		celsius * 18 /10 + 32
	else
		celsius * 1.8 + 32
	end
end