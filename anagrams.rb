def first_anagram?(word1, word2)
  word1.chars.permutation.map { |array| array.join('') }.include?(word2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")

def second_anagram?(word1, word2)
  word1a = word1.chars
  word2a = word2.chars
  word1dup = word1a.dup
  word1a.each do |letter|
    if word2a.include?(letter)
      word1dup.delete(letter)
    end
  end
  word1dup.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")

def fourth_anagram?(word1, word2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  word1.chars.each do |char|
    hash1[char] += 1
  end

  word2.chars.each do |char|
    hash2[char] += 1
  end

  hash1 == hash2

end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")
