def first_anagram(str1, str2)
  perms = str1.chars.permutation
  strings = perms.map { |perm| perm.join("") }
  strings.include?(str2)
end


def second_anagram(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")

  arr1.each_with_index do |letter1, i|
    arr2.each_with_index do |letter2, j|
      if letter1 == letter2
        arr1[i] = ""
        arr2[j] = ""
        break
      end
    end
  end

  arr1.join("") == "" && arr2.join("") == ""
end

def third_anagram(str1, str2)
  str1 = str1.chars.sort.join
  str2 = str2.chars.sort.join
  str1 == str2
end

def fourth_anagram(str1, str2)
  hash1 = string_to_hash(str1)
  hash2 = string_to_hash(str2)
  hash1 == hash2
end

def fourth_anagram_bonus(str1, str2)
  hash = string_to_hash(str1)
  hash = string_to_hash(str2, hash)
  hash.values.inject(:+) == 0
end

def string_to_hash(str, str_hash = nil)
  if str_hash.nil?
    str_hash = Hash.new(0)
    dx = 1
  else
    dx = -1
  end
  str.each_char do |letter|
    str_hash[letter] += dx
  end
  str_hash
end



p fourth_anagram_bonus("like", "ekli")
p fourth_anagram_bonus("like", "eklil")
