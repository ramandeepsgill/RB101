=begin

Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

Thinking aloud:

- the elements of the array are hashes
- we have to select only those hashes where all the integers are true
- So we can use the select method on the given array
- in the block following the select method we will pass hash as the argument.
- Now for each hash we have to check if for all key, value pairs all the values are even integer arrays
- We can use all? method to check that

=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [4, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |elem|
      elem.even?
    end
  end
end

p arr2