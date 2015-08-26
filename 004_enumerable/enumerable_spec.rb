require 'enumerable'

RSpec.describe Enumerable do
	describe 'my_each' do
		it 'returns Enum if called without block' do
			expect([1,2,3].my_each == [1,2,3].each)
		end
		it 'calculates inside block' do
			sum1 = 0
			sum2 = 0
			[1,2,3].my_each{|i|sum1+=i}
			[1,2,3].each{|i|sum2+=i}
			expect(sum1).to eq(sum2)
		end
	end
	describe 'my_each_with_index' do
		it 'returns Enum if called without block' do
			expect([1,2,3].my_each_with_index == [1,2,3].each)
		end
		it 'calculates inside block with index' do
			sum1 = 0
			sum2 = 0
			[1,2,3].my_each_with_index{|el,i|sum1+=el*i}
			[1,2,3].each_with_index{|el,i|sum2+=el*i}
			expect(sum1).to eq(sum2)
		end
	end
end