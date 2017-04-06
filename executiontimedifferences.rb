
def my_min(array)
  array.each do |num|
   return num if array.all?{|i| num <= i}
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)

def my_min2(array)
  min = array.first
  array.each do |num|
    min = num if num < min
  end
  min
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min2(list)

def largest_contiguous_subsum(array)
  res = []
  array.length.downto(1).each do |i|
    array.each_cons(i).each do |subset|
      res << subset.reduce(:+)
    end
  end
  res.max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

def largest_contiguous_subsum2(array)
  max = array.first
  running_total = max
  array[1..-1].each do |num|
    running_total += num
    if running_total >= max
      max = running_total
    elsif num > max
      max = num
      running_total = max
    elsif running_total < 0
      running_total = 0
    end
  end
  max
end

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])
