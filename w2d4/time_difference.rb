def my_min(arr)
  minimum = arr.first

  arr.each do |elem1|
    curr_min = elem1

    arr.each do |elem2|
      if curr_min > elem2
        curr_min = elem2
      end
    end

    if curr_min < minimum
      minimum = curr_min
    end
  end

  minimum
end

def my_min_better(arr)
  minimum = arr.first

  arr[1..-1].each do |num|
    if num < minimum
      minimum = num
    end
  end

  minimum
end

def largest_contiguous_subsum(arr)
  subs = []

  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      subs << arr[i..j]
      j += 1
    end
    i += 1
  end

  maximum = subs.first.inject(0) { |sum, num| sum + num }
  subs.each do |sub_arr|
    total = sub_arr.inject(0) { |sum, num| sum + num }
    if total > maximum
      maximum = total
    end
  end

  maximum
end

def largest_contiguous_subsum_better(arr)
  maximum = arr.first
  total = maximum

  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      total = arr[i..j].inject(0) { |sum, num| sum + num }
      if total > maximum
        maximum = total
      end
      j+=1
    end
    i += 1
  end

  maximum
end

def largest_contiguous_subsum_hopeful(arr)
  real_max = arr.first
  real_min = 0
  curr_max = 0

  arr.each do |num|
    curr_max += num

    if curr_max > real_max
      real_max = curr_max
    end

    if curr_max < real_min
      real_min = curr_max
      curr_max = 0
    end
  end

  real_max
end


def largest_contiguous_subsum_hopeful(arr)
  real_max = arr.first
  curr_max = 0

  arr.each do |num|
    curr_max += num

    if curr_max > real_max
      real_max = curr_max
    end

    if curr_max < 0
      curr_max = 0
    end
  end

  real_max
end


# p my_min_better([1, 3, 2, 4, 5, 6])
# p my_min_better([10, 37, 98, 64, 1])
# p my_min_better([4, 90, 8, 7, -10, 87])

#p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
p largest_contiguous_subsum_hopeful([2, 3, -6, 7, -6, 7, -5])
p largest_contiguous_subsum_hopeful([1, 2, 3])
p largest_contiguous_subsum_hopeful([-1, -2, -3])
p largest_contiguous_subsum_hopeful([1, 2, 3, -1, 4])
p largest_contiguous_subsum_hopeful([1, 2, 3, -1])
p largest_contiguous_subsum_hopeful([1, 2, 3, -1, -2, -3])
p largest_contiguous_subsum_hopeful([-1, 2, 3, -1, -2, -3,-4,10])
