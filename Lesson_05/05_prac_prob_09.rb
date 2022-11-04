=begin

Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

Problem description:

Output = [["a", "b", "c"], [1, 2, 3], ["black", "blue", "green"]]

Algorithm:

- The input array is a nested array, as each element of the array is a sub-array
- Call the map method on the input array.
- The block for map method should sort the array.

=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_array = arr.map do |sub_arr|
  sub_arr.sort.reverse
end

p sorted_array

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_array = arr.map do |sub_arr|
  sub_arr.sort do |a,b|
    b <=> a
  end
end

p sorted_array