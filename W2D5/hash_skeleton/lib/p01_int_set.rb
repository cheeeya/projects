class MaxIntSet

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    if !include?(num)
      @store[num] = true
    else
      raise "Int already exist"
    end
  end

  def remove(num)
    validate!(num)
    if include?(num)
      @store[num] = false
    else
      raise "Int not in set"
    end
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @store.length
  end

  def validate!(num)
    raise "out of bounds" if !is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if include?(num)
      raise "Int already in set"
    else
      self[num] << num
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    else
      raise "Int does not exist in set"
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end

    if include?(num)
      raise "Int already in set"
    else
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    else
      raise "Int does not exist in set"
    end
  end

  def include?(num)
    self[num].include?(num)
  end


  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store2 = Array.new(num_buckets * 2) { Array.new }
    @store.each do |array|
      array.each do |el|
        store2[el % ( 2 * num_buckets) ] << el
      end
    end
    @store = store2
  end
end
