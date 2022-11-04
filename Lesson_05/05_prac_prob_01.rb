=begin

How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

Algorithm:

- Since the input array has string elements and we need to sort them by numeric values, we need to convert the strings to integers
- To sort them in descending order we will sort them by -integer

=end

arr = ['10', '11', '9', '7', '8']

arr.sort_by! { |str| -(str.to_i) }

p arr
