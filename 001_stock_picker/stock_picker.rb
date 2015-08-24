def stock_picker(stock)
	size = stock.size
	diff = []
	(size-1).times do |index|
		max = stock[index+1...size].each_with_index.max[1]
		diff << [index+1+max , stock[index+1+max]-stock[index]]
	end
	index = diff.map{|each|each[1]}.each_with_index.max[1]
	[index, diff[index][0]]
end