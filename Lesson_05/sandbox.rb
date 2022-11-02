arr1 = ["a", "b", "c"]

puts "arr1 is #{arr1}"

arr2 = arr1.dup

puts "arr2 is #{arr2}"

arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]

puts "After map! method arr1 is #{arr1}"

puts "After map! mthod arr2 is #{arr2}"