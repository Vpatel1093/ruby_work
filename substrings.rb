#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case sensitive) that was found in the original string and how many times it was found.

def substrings(words_to_be_searched,dictionary)
	substring_counts = {}
	count=0
	w = words_to_be_searched.downcase.split(' ')
	dictionary.each do |sub|
		w.each do |word|
			count +=1 if (word.include? sub)
		end
		substring_counts[sub] = count if count>0
		count = 0
	end
	puts substring_counts
end

puts "Enter word:"
words = gets.chomp
puts "Enter dictionary words, seperated by commas:"
dictionary = gets.chomp.split(",").map(&:strip)
substrings(words,dictionary)
