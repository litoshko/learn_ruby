class Dictionary
	attr_reader :entries
	def initialize
		@entries = {}
	end
	def add(entrie)
		if entrie.is_a?(Hash)
			@entries.update entrie
		elsif entrie.is_a?(String)
			@entries[entrie]=nil
		end
	end
	def keywords
		@entries.keys.sort
	end
	def include?(string)
		@entries.include? string
	end
	def find(string)
		@entries.select{|k,v| k.start_with?(string)}
	end
	def printable
		@entries.map{|k,v| %Q{[#{k}] "#{v}"}}.sort.join("\n")
	end
end