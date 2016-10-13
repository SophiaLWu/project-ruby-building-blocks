# Takes an array of stock prices (one for each hypothetical day) and returns a
# pair of days representing the best day to buy and best day to sell
# Note: This runs in linear time.
def stock_picker(stock_prices)
  buying_price = 0
  buying_index = 0
  selling_price = 0
  max_profit = -1
  max_buy_index = 0
  max_sell_index = 0

  change_buy = true

  stock_prices.each_with_index do |price, day|
    selling_price = stock_prices[day + 1].to_i

    if change_buy
      buying_price = price.to_i
      buying_index = day
    end

    if buying_price > selling_price
      change_buy = true;
    else
      profit = selling_price - buying_price
      if profit > max_profit
        max_profit = profit
        max_sell_index = day + 1
        max_buy_index = buying_index
      end
      change_buy = false;
    end

  end

  [max_buy_index, max_sell_index]

end


# Tests
puts stock_picker([17,3,6,9,15,8,6,1,10]) == [1,4]
puts stock_picker([1,2,3,4,5,6]) == [0,5]
puts stock_picker([3,6,11,15,2,7,19,3,4,27]) == [4,9]
puts stock_picker([3,6,11,30,2,7,19,3,4,27]) == [0,3]
puts stock_picker([6,5,4,3,2]) == [0,0]



