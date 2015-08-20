class Temperature
	def initialize(hash)
		@temperature = ftoc hash[:f] if !hash[:f].nil?
		@temperature = hash[:c] if !hash[:c].nil?
	end
	def self.from_celsius(temp)
		Temperature.new({c:temp})
	end
	def self.from_fahrenheit(temp)
		Temperature.new({f:temp})
	end

	def in_fahrenheit
		ctof(@temperature)
	end

	def in_celsius
		@temperature
	end

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
end

class Celsius < Temperature
	def initialize(temp)
		@temperature = temp
	end
end
class Fahrenheit < Temperature
	def initialize(temp)
		@temperature = ftoc temp
	end
end