def substrings(string, dictionary)
	count = {}
	dictionary.each do |word|
		string.downcase.scan(word) do
			count[word]||=0
			count[word]+=1
		end
	end
	count
end