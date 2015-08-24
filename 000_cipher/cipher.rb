def caesar_cipher(text, key)
	unless text.nil?
		text.unpack('c*').map do | num |
			if ((num >= 65)&&(num <= 90))
				( num - 65 + key ) % 25 + 65
			elsif ((num >= 97)&&(num <= 122))
				( num - 97 + key ) % 25 + 97
			else
				num
			end
		end.pack('c*')
	end
end