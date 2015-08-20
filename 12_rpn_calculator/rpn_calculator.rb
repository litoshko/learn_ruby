class RPNCalculator
	def initialize
		@stack = []
		@epsilon = 0.000001
	end

	def push(number)
		@stack.push(number)
	end
	def operation(&block)
		if @stack.size>1
			y = @stack.pop
			x = @stack.pop
			yield(x,y)
		else
			raise "calculator is empty"
		end
	end
	def plus
		@stack.push(operation {|x,y| x+y})
	end
	def minus
		@stack.push(operation {|x,y| x-y})
	end
	def times
		@stack.push(operation {|x,y| x*y})
	end
	def divide
		@stack.push(operation {|x,y| x/y.to_f})
	end
	def value
		@stack.last
	end
	def tokens(string)
		string.split.map do |word|
			if word.to_f != 0.0
				if (word.to_f-word.to_i) < @epsilon
					word.to_i
				else
					word.to_f
				end
			else
				word.to_sym
			end
		end
	end
	def evaluate(string)
		tokens(string).each do |token|
			if token == :+
				plus
			elsif token == :-
				minus
			elsif token == :*
				times
			elsif token == :/
				divide
			else
				push(token)
			end
		end
		value
	end
end