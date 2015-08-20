class Array
	def sum
		if self.empty?
			0
		else
			self.inject{|sum, elem| sum+=elem}
		end
	end
	def square
		if self.empty?
			[]
		else
			self.map{|elem| elem**2}
		end
	end
	def square!
		if self.empty?
			[]
		else
			self.map!{|elem| elem**2}
		end
	end
end