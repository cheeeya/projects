class Array
  def my_uniq
    hash = {}
    self.each { |el| hash[el] = 0 }
    hash.keys
  end

  def two_sum
    result = []
    i = 0
    while i < count
      j = i + 1
      while j < count
        result << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    result
  end
end

def my_transpose(matrix)
  transposed = Array.new(matrix[0].length) {Array.new(matrix.length)}
  matrix.each_with_index do |row, idx|
    row.each_with_index do |el, idx2|
      transposed[idx2][idx] = el
    end
  end
  transposed
end

def stock_picker(stock_prices)
  lowest_buy = stock_prices[0]
  lowest_buy_index = 0
  best_sell = stock_prices[0]
  best_sell_index = 0
  stock_prices[1..-1].each_with_index do |price, day|
    if price > best_sell
      best_sell = price
      best_sell_index = day + 1
    end
  end
  stock_prices[0...best_sell_index].each_with_index do |price, day|
    if price < lowest_buy
      lowest_buy = price
      lowest_buy_index = day
    end
  end
  [lowest_buy_index, best_sell_index]
end

class TowersOfHanoi
  attr_reader :towers;
  def initialize
    @towers = [[3,2,1], [],[]]
  end

  def move(start, finish)
    if @towers[finish].empty? || @towers[start][-1] < @towers[finish][-1]
      @towers[finish].push(@towers[start].pop)
    else
      raise "Cannot move larger onto smaller"
    end
  end

  def won?
    @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
  end
end
