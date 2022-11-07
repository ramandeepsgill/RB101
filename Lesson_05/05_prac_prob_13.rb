=begin

Practice Problem 13
Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

The sorted array should look like this:

[[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

Algorithm:

- use the sort method with a block
- in the block <=> the values of the arrays which only have the odd numbers selected from their respective sub-arrays

=end

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]


arr2 = arr.sort do |a, b|
    a.select { |elem| elem.odd? } <=> b.select { |elem| elem.odd? }
end

p arr2