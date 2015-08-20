class Timer

	def initialize
		@timer = Time.new(1991)

	end

	def seconds
		@timer.sec
	end
	def seconds=(seconds)
		@timer = Time.at(seconds)
	end
	def time_string
		@timer.utc.strftime('%T')
	end
end