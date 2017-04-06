def windowed_max_range_bad(arr, w)
  current_max_range = nil
  arr.each_cons(w) do |combo|
    candidate = combo.max - combo.min
    if current_max_range.nil? || (candidate > current_max_range)
      current_max_range = candidate
    end
  end
  current_max_range
end


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end


class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[:el]
  end

  def push(el)
    if max.nil? || el > max
      biggest = el
    else
      biggest = max
    end

    if min.nil? || el < min
      smallest = el
    else
      smallest = min
    end

      el_hash = {}
      el_hash[:el] = el
      el_hash[:max] = biggest
      el_hash[:min] = smallest


    @store.push(el_hash)
  end

  def peek
    @store.last[:el]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end




  def min
    return nil if empty?
    @store.last[:min]
  end

end


class StackQueue

  def initialize
    @primary = MyStack.new
    @secondary = MyStack.new
  end

  def enqueue(el)
    @primary.push(el)
  end

  def dequeue
    until @primary.size == 1
      @secondary.push(@primary.pop)
    end
    holder = @primary.pop
    until @secondary.size == 0
      @primary.push(@secondary.pop)
    end
    holder
  end

  def peek
    @primary.peek
  end

  def size
    @primary.count
  end

  def empty?
    @primary.empty?
  end

  def max
    @primary.max
  end

  def min
    @primary.min
  end
end

def windowed_max_range(arr,w)
  wind = StackQueue.new
  w.times do
    wind.enqueue(arr.shift)
  end
  diff = wind.max - wind.min
  until arr.empty?
    wind.enqueue(arr.shift)
    wind.dequeue
    window_diff = wind.max - wind.min
    diff =  window_diff > diff ? window_diff : diff
  end
  diff
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
