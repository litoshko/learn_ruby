class Friend 
	def greeting(string='')
		if string.empty?
			"Hello!"
		else
			"Hello, #{string}!"
		end
	end

end