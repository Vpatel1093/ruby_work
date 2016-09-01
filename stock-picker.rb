#Implement a method that takes an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(stocks)
	current_max_gain=0
	buy_sell_days = [0,0]
	stocks.each_with_index do |buy_price,i|
		stocks[i+1..-1].each_with_index do |sell_price,j|
			if sell_price-buy_price > current_max_gain
				current_max_gain = sell_price - buy_price
				buy_sell_days=[i,i+j+1]
			end
		end
	end
	puts "If you buy on day #{buy_sell_days[0]} and sell on day #{buy_sell_days[1]}, you will have the optimal profit of #{current_max_gain}."
end

puts "Enter stock values for each hypothetical day, seperated with commas"
stocks_array = gets.chomp.split(',').map {|price| price.to_i}
stock_picker(stocks_array)
