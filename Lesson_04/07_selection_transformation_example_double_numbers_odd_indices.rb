=begin

For a given array, double the numbers at the odd indices

Understanding the problem:

Example

[1 2 3 4 5] => [1 4 3 8 5] - doubling the number at odd indices i.e index 1, index 3 ...

Input - array
Output - a new array (choosing not to mutate the input array)

Algorithm
=========

1. Intialize an empty array to hold the numbers that will be doubled
2. set a counter variable equal to 0
3. Loop through the given array
    a. Check if the index of the array element is odd
    b. if the index is odd, multiply that number with 2 and add it to the empty array created in step 1.
    c. if the index is even, just add the number as is to the array created in step 1
    d. increment the counter
    e. break if the counter is equal to the size of the input array.
4. Return the new array

=end

def double_odd_indices_numbers(nums_arr)
  
  dbl_odd_indices_nums = []
  counter = 0
  
  loop do
    break if counter == nums_arr.size
    
    if counter.odd? 
      dbl_odd_indices_nums << nums_arr[counter] * 2
    else
      dbl_odd_indices_nums << nums_arr[counter]
    end
    
    counter += 1
    
  end
  
  dbl_odd_indices_nums
  
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices_numbers(my_numbers)
