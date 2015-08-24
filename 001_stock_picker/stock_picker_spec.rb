require 'stock_picker'

RSpec.describe "Stock picker" do
	describe 'picker' do
		it 'return most profitable day pair' do
			expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
		end
		it 'return most profitable day pair in border' do
			expect(stock_picker([17,3,6,9,15,8,6,1,23])).to eq([7,8])
		end
	end	
end