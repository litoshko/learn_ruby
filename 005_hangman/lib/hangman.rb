require 'json'

class Hangman

	def initialize
		dictionary = load_dictionary('5desk.txt')

		@word = choose_word(dictionary)

		@max_errors = 6
		@guessed_word = '_'*@word.length

		@errors = []

		puts "Game 'hangman' initialized"
	end

	def save
		json = JSON.generate({
			word: @word,
			guessed_word: @guessed_word,
			errors: @errors
			})
		File.open("tmp.json","w"){|file| file << json}
		puts "game saved"
	end

	def load
		json = File.read("tmp.json")
		hash = JSON.parse(json, symbolize_names: true)
		word = hash[:word]
		@guessed_word = hash[:guessed_word]
		@errors = hash[:errors]
		if game_over?
			puts "No active save file found"
			initialize
		else
			puts "Game loaded!"
		end
	end

	def load_dictionary(filename)
		lines = File.readlines('5desk.txt')
		lines.select{ |word| word.length > 5 && word.length < 12 }.map{ |word| word.chomp}
	end

	def choose_word(dictionary)
		index = rand(dictionary.length)
		dictionary[index].downcase
	end

	def input
		letter = gets.chomp
		if letter =~ /1/
			save
		end
		if letter.length == 1 && letter =~ /^[a-zA-Z]$/
			letter.downcase
		else
			false
		end
	end

	def game_over?
		if player_wins? || @errors.count >  @max_errors - 1
			true
		else
			false
		end
	end

	def player_wins?
		if !@guessed_word.include?('_')
			puts "You Win!"
			true
		else
			false
		end
	end

	def letter_used?(guess)
		if @errors.include?(guess) || @guessed_word.include?(guess)
			puts "You have already used letter '#{guess}'. Try another letter"
			true
		else
			false
		end
	end

	def start_game

		puts "Would you like to load your last geme? (y/n)"
		choice = gets.chomp.downcase
		load if choice == 'y'

		loop do
			
			puts "Word: #{@guessed_word}"
			puts "Errors (#{@errors.size}): #{@errors.join(', ')}"
			
			if game_over?
				puts "Word was: #{@word}"
				puts "Game over!"
				break
			end

			print "Letter (input '1' to save): "
			if (guess = input)

				next if letter_used?(guess)

				if @word.include? guess
					@word.each_char.with_index do |char, i|
						if @word[i] == guess
							@guessed_word[i] = @word[i] 
						end
					end
				else
					@errors << guess
				end

			else
				puts "Please input a letter."
				next
			end
		end

	end
end

game = Hangman.new
game.start_game