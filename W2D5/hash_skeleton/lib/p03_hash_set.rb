require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end

    hash_key = key.hash

    if include?(key)
      raise "Key already in set"
    else
      self[hash_key] << key
      @count += 1
    end
  end

  def include?(key)
    hash_key = key.hash
    self[hash_key].include?(key)
  end

  def remove(key)
    hash_key = key.hash
    if include?(key)
      self[hash_key].delete(key)
      @count -= 1
    else
      raise "Key does not exist in set"
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
      @store[key % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    flat_store = @store.flatten
    @store = Array.new(num_buckets *2) {Array.new}
    flat_store.each do |key|
      self.insert(key)
    end
  end
end
