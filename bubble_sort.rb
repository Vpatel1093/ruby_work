def bubble_sort(array)
	(array.length-1).times do
		(array.length-1).times do |a|
			if array[a]>array[a+1]
				array[a],array[a+1]=array[a+1],array[a]
			end
		end
	end
	puts array.join(' ')
end

bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
	(array.length-1).times do
		(array.length-1).times do |a|
			if yield(array[a],array[a+1])>0
				array[a],array[a+1]=array[a+1],array[a]
			end
		end
	end
	puts array.join(' ')
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end
 
#>>0 2 2 3 4 78
#>>hi hey hello
