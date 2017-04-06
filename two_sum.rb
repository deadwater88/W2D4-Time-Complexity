 def bad_two_sum?(arr, target_sum)
   arr.combination(2).any? {|x, y| x + y == target_sum}
 end

 arr = [0, 1, 5, 7]
 p bad_two_sum?(arr, 6) # => should be true
 p bad_two_sum?(arr, 10)

def ok_two_sum?(arr, target)
  sorted = arr.sort
  start = 0
  nd = arr.length - 1
  until start == nd
    case sorted[start] + sorted[nd] <=> target
    when 0
      return true
    when -1
      start += 1
    when 1
      nd -= 1
    end
  end
  false
end

p ok_two_sum?(arr, 6) # => should be true
p ok_two_sum?(arr, 10)

#O(nlogn) because of sorting

def hash_two_sum?(arr, target)
  hash = {}
  arr.each do |num|
    return true if hash[target - num]
    hash[num] = true
  end
  false
end

p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10)

# Time complexity is O(n)
