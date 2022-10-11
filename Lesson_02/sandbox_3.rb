require "pry"
a = [0,0]

until a.include?(3)
  p a
  p a.each_index {a[0] += 1}
  binding.pry
end