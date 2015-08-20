class Fixnum
	WORDS_FIRST_20 = [
		'zero',
		'one',
		'two',
		'three',
		'four',
		'five',
		'six',
		'seven',
		'eight',
		'nine',
		'ten',
		'eleven',
		'twelve',
		'thirteen',
		'fourteen',
		'fifteen',
		'sixteen',
		'seventeen',
		'eighteen',
		'nineteen'
	]
	WORDS_TENS = {
		20 => 'twenty',
		30 => 'thirty',
		40 => 'forty',
		50 => 'fifty',
		60 => 'sixty',
		70 => 'seventy',
		80 => 'eighty',
		90 => 'ninety'
	}
	WORDS_BIG = {
		1 => 'thousand',
		2 => 'million',
		3 => 'billion',
		4 => 'trillion'
	}

	def in_words
		number = self
		calculated_strings = []
		if number < 1000
			less_then_1000(number)
		else
			multi = 1
			count = 1
			while multi < number
				count += 1 
				multi *= 1000
			end
			count.times do
				calculated_strings << less_then_1000( number % 1000)
				number /=1000
			end
			p calculated_strings
			result = ''
			calculated_strings.map.with_index do |value,index|
				if value != 'zero'
					if index == 0
						result = value + result
					else 
						result = value +' '+ WORDS_BIG[index] +' '+ result
					end	
				elsif self == 0
					result = 'zero'
				end
			end
			result.chomp(' ')
		end
	end

	def less_then_1000(number)
		if number < 100 
			less_then_100(number) 
		elsif number < 1000
			if number % 100 != 0
				tens = ' ' + less_then_100(number % 100)
			else
				tens = ''
			end
			hundreds = WORDS_FIRST_20[ number / 100 ]+' hundred'+tens
		end
	end

	def less_then_100(number)
		if number < 20
			WORDS_FIRST_20[number]
		elsif number < 100
			if !WORDS_TENS[number].nil?
				WORDS_TENS[number]
			else
				tens = (number/10)*10
				ones = number%10
				WORDS_TENS[tens]+' '+WORDS_FIRST_20[ones]
			end
		end
	end
end