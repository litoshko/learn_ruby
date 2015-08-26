module Enumerable
	def my_each(&block)
		unless block_given?
			return self.to_enum
		else
			self.length.times do |i|
				yield(self[i])
			end
		end
		return self
	end
	def my_each_with_index(&block)
		unless block_given?
			return self.to_enum
		else
			self.length.times do |i|
				yield(self[i], i)
			end
		end
	end
end