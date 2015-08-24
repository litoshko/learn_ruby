require 'cipher'

RSpec.describe 'Caesar cipher' do
	describe 'encode' do
		it 'for empty returns empty' do
			expect( caesar_cipher('',2) == '' )
		end
		it 'changes "a" to "c" with key 2' do
			expect( caesar_cipher('a',2) == 'c' )
		end
		it 'changes "z" to "d" with key 4' do
			expect( caesar_cipher('z',3) == 'd' )
		end
		it 'changes "Z" to "D" with key 4' do
			expect( caesar_cipher('Z',3) == 'D' )
		end
		it 'encodes full string correctly' do
			expect( caesar_cipher('What a string!',5) == 'Bmfy f xywnsl!' )
		end
	end
end