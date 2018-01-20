# O(n^2) solution
def two_sum?(arr, target_sum)
  i = 0
  while i < arr.length
    j = 0
    while j < arr.length
      return true if i != j && arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end


# O(n log n)
def ok_two_sum?(arr, target_sum)
  arr = arr.sort

  arr.each_with_index do |num, index|
    return true if binary_search(arr, target_sum - num, index)
  end

  false
end

def binary_search(arr, target, index)
  l = 0
  r = arr.length - 1
  mid = arr.length / 2

  # -1 0 1
  while l <= r
    case target <=> arr[mid]
    when -1
      r = mid - 1
    when 0
      return true if index != mid
      l += 1
    when 1
      l = mid + 1
    end
      mid = l + (r - l) / 2
  end

  false
end

def hash_two_sum?(arr, target_sum)
  arr_hash = array_to_hash(arr)

  arr_hash.keys.each do |num|
    target = target_sum - num
    #return true if arr_hash[target_sum - num].nil?
    # p num
    # p target
    # p arr_hash[target]
    if arr_hash[target]>0 && target != num
      return true
    else
      if arr_hash[target] > 1
        return true
      end
    end
    #return true if (num == target_sum - num && arr_hash[num] > 1) || (num != target_sum - num && arr_hash[target_sum - num] > 0)
  end
  false
end

def array_to_hash(arr)
  hashy = Hash.new(0)
  arr.each do |num|
    hashy[num] += 1
  end
  hashy
end


def hash_two_sum2?(arr, target_sum)
  hashy = Hash.new

  arr.each do |num|
    if hashy[num].nil?
      hashy[target_sum - num] = num
    else
      return true
    end
  end

  false
end


arr = [0, 1, 5, 7]
p hash_two_sum2?(arr, 6) # => should be true
p hash_two_sum2?(arr, 10) # => should be false

p hash_two_sum2?(arr, 5)
p hash_two_sum2?(arr, 7)
