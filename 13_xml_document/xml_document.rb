class XmlDocument
	def initialize(bool=false)
		@indent = bool
	end
	def method_missing(sym,*args,&block)
		if block_given?
			if @indent
				nl = "\n"
				now = yield.split("\n").map{|line| "  "+line}.join("\n")
			else
				nl = ""
				now = yield
			end

			if args.empty?
				before = "<#{sym.to_s}>#{nl}"
				after = "#{nl}</#{sym.to_s}>#{nl}"

				before + now + after
			else
				pair = args[0].to_a.flatten
				before = [
					"<#{sym.to_s}",
					pair[0].to_s+"='#{pair[1].to_s}'>#{nl}"
					].join(' ')
				after = "#{nl}</#{sym.to_s}>#{nl}"
	
				before + now + after
			end
		else
			if args.empty?
				"<#{sym.to_s}/>"
			else
				pair = args[0].to_a.flatten
				["<#{sym.to_s}",
					pair[0].to_s + "='#{pair[1].to_s}'/>"
					].join(' ')
			end
		end
	end
end