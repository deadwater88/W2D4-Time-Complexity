require_relative 'anagrams'

def looprun(n,method, teststring1, teststring2)
  a = Time.now
  n.times do
    send(method, teststring1, teststring2)
  end
  p Time.now - a
end
