class MinMaxStackQueue

  attr_accessor :min, :max, :q_array

  def initialize
    @q_array = []
    @min = nil
    @max = nil
  end

  def enqueue(el)
    q_array.push(el)
    if  @min.nil? || el < @min
      @min = el
    end
    if @max.nil? || el > @max
      @max = el
    end
  end

  def dequeue
    removed_el = q_array.shift
    if removed_el == @min || removed_el == @max
      sorted = q_array.sort
      @min = sorted[0]
      @max = sorted[-1]
    end
  end

  def range
    @max - @min
  end
end

def windowed_max_range(array, window_size)
  queue = MinMaxStackQueue.new
  i = 0
  while (i < window_size)
    queue.enqueue(array.shift)
    i += 1
  end
  range = queue.range
  while !array.empty?
    queue.enqueue(array.shift)
    queue.dequeue
    range = queue.range if queue.range > range
  end
  range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6# 3, 2, 5, 4, 8
