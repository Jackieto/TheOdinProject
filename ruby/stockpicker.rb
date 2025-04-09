def stock_picker(prices)
  best_profit = 0
  best_buy_day = 0
  best_sell_day = 0

  (0...prices.size).each do |i|
    (i + 1...prices.size).each do |j|
      profit = (prices[j] - prices[i])
      next unless profit > best_profit

      best_profit = profit
      best_buy_day = i
      best_sell_day = j
    end
  end

  puts "Buy on day #{best_buy_day} at price #{prices[best_buy_day]}"
  puts "Sell on day #{best_sell_day} at price #{prices[best_sell_day]}"
  puts "Maximum profit: #{best_profit}"
end


stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
