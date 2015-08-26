def bubble_sort(array)
	size = array.size
	(size-1).times do |j|
		(size - j -1).times do |i|
			if block_given?
				array[i], array[i+1] = array[i+1], array[i] if yield(array[i+1], array[i])>0
			else
				array[i], array[i+1] = array[i+1], array[i] if array[i] > array[i+1]
			end
		end
	end
	array
end