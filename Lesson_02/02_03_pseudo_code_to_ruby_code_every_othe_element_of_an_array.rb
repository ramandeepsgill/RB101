# # 03. a method that takes an array of integers, and returns a new array with every 
# # other element from the original array, starting with the first element. 
# # For instance:

# # everyOther([1,4,7,2,5]) # => [1,7,5]

# -Given an array of integers
# -Create an empty resulting array
# -set the iterator to 0 and iterate through the given array of integers
# -add the given array of integers at iterator index to the resulting array
# -increment the iterator by 2
# -Print the resulting array

# # more formal pseudo-code

# START

# # given an array of integers

# SET resulting_array = []
# SET iterator = 0

# WHILE iterator < size of given array of integers
#   resulting_array[iterator] = given_array[iterator]
#   iterator = iterator + 2
# END

# PRINT resulting_array

# END

# Update: while converting pseudo-code, I found a mistake in my algorithm
# i.e. I had to set a separate counter for my 'resulting_array'

arr = [1, 2, 3, 4, 5, 6, 7]

resulting_array = []
iterator = 0
counter = 0

while iterator < arr.size
  resulting_array[counter] = arr[iterator]
  counter = counter + 1
  iterator = iterator + 2
end

p resulting_array