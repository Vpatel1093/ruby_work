#Implement Caeser cipher that takes input string, applies shift factor, and outputs modified string

def caeser_cipher(input_string,shift_factor)
	ciphered=[]
	shift = (shift_factor.to_i)%26
	input_string.each_char do |char|
		if (65..90) === char.ord
			new_char = char.ord + shift
			new_char -= 26 if new_char>90
		elsif (97..122) === char.ord
			new_char = char.ord + shift
			new_char -= 26 if new_char>122
		end
		ciphered.push(new_char.chr)
	end
	puts ciphered.join
end


puts "Input String:"
input_string = gets.chomp
puts "Shift Factor:"
shift_factor = gets.chomp
puts "Caeser Cipher:"
caeser_cipher(input_string,shift_factor)
