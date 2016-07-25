def stock_picker(prices)
  benefit=0
  buy=0
  sell=0

  (0..prices.length-2).each do |i|
    (i+1..prices.length-1).each do |j|
      if ( prices[j] - prices[i] ) > benefit
        benefit= prices[j] - prices[i]
        buy=i
        sell=j
      end
    end
  end
  puts buy.to_s + ' ' + sell.to_s
end

stock_picker([17,3,6,9,15,8,6,1,10])
