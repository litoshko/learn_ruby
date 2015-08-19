def translate(string)
	array = string.split.map do | word |
		parts = word.partition(/^(qu|[^aeiou])+/).reverse.push(['ay']).join('')
	end
	array.join(' ')
end