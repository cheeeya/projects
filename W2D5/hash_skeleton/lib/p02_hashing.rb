require 'byebug'
# class Fixnum
#   # Fixnum#hash already implemented for you
# end

class Array
  def hash
    array_sum = 0
    self.each_with_index do |el, idx|
      el_value = el
      if (el.is_a?(String))
        el_value = el.ord
      end
      array_sum += el_value.hash % (idx.hash)
    end
    array_sum.hash
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_sum = 0
    self.each do |x,y|
      hash_sum += x.hash + y.hash
    end
    hash_sum.hash
  end
end
