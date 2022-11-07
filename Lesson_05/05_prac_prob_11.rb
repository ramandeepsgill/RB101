=begin

Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

Expected Output = [[], [3], [9], [15]]

Algorithm:

- use map method
- within the block for map method use select method
- within the block for select method check if the number is a multiple of 3

=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |sub_arr|
  sub_arr.select do |elem|
    elem % 3 == 0
  end
end

p arr2