class Book
	EXCEPTIONS = [
		'the', 'a', 'an',#articles
		'and','but','for','nor','or','so','yet',#conjunctions
		'on','in','at','since','for','ago','before','to','past','by','of'#prepositions
	]
	def title
		@title
	end
	def title=(title)
		@title = title.split.map.with_index do |word,i|
			if i==0||!EXCEPTIONS.include?(word)
				word.capitalize
			else
				word
			end
		end
		@title = @title.join(' ')
	end
end