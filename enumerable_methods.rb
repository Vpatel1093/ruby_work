module Enumerable
	def my_each
		return self.to_enum if !block_given?

		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self.to_enum if !block_given?

		index=0
		for i in self
			yield(i,index)
			index+=1
		end
	end

	def my_select
		return self.to_enum if !block_given?

		selection=[]
		for i in self
			selection << i if yield(i)
		end
		selection
	end

	def my_all?
		return true if !block_given?
		true while self.my_each {|i| yield(i)}
	end

	def my_any?
		return true if !block_given?
		self.my_each {|i| return true if yield(i)}
		false
	end	

	def my_none?
		return false if !block_given?
		self.my_each {|i| return false if yield(i)}
		true
	end

	def my_count
		count=0
		self.my_each {|i| count+=1 if yield(i)}
		count
	end

	def my_map(proc=nil)
		return self.to_enum if !block_given?

		result=[]
		for i in self
			result << yield(proc.call(i)) if proc and block_given?
			result << proc.call(i) if !block_given?
			result << yield(i) if !proc and block_given?
			result = self if !proc and !block_given?
		end
		result
	end

	def my_inject(accumulator=nil)
		return self.first if !block_given?	

		if accumulator.nil?
			accumulator=self.first
		end
		self.my_each do |i|
			accumulator = yield(i,accumulator)
		end
		accumulator
	end
end		

def multiply_els(array)
	array.my_inject(1) {|product,element| product*element}
end																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
