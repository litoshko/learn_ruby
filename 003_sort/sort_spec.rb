require 'sort'

RSpec.describe 'Sort' do
	it 'sorts normal array' do 
		expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
	end

	it 'sorts an array with block given' do 
		expect(bubble_sort(["hi","hello","hey"]) do |left,right|
			right.length - left.length
		end).to eq(["hi", "hey", "hello"])
	end
end