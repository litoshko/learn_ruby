def echo(string)
	string
end
def shout(string)
	string.upcase
end
def repeat(string,number=2)
	array = Array.new(number)
	array.fill(string)
	array.join(' ')
end
def start_of_word(word,number)
	word[0...number]
end
def first_word(string)
	string.split[0]
end
def titleize(string)
	little_words=['the','over','and']
	words  = string.split
	words[0].capitalize!
	words.map! do |word|
		if !little_words.include?(word)
			word.capitalize
		else
			word
		end
	end
	words.join(' ')
end