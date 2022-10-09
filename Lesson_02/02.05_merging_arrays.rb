# a method that takes two arrays of numbers and returns the result of merging the
# arrays. The elements of the first array should become the elements at the even 
# indexes of the returned array, while the elements of the second array should 
# become the elements at the odd indexes. For instance:

# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

# You may assume that both array arguments have the same number of elements.

# Pseudo-code

# START

# Given 2 arrays of the same size

# SET number_of_iterations = 2 * size of any given array

# SET new_array = []

# SET array_1_index = 0
# SET array_2_index = 0

# SET iterator = 0

# WHILE iterator < number_of_iterations
#   IF iterator is even
#     new_array[iterator] = array_1[array_1_index]
#     array_1_index = array_1_index + 1
#   ELSE
#     new_array(iterator) = array_2[array_2_index]
#     array_2_index = array_2_index + 1
#   END

#   iterator = iterator + 1
# END

# PRINT new_array

# END

array_1 = [1, 2, 3]
array_2 = [4, 5, 6]

number_of_iterations = 2 * array_1.size

array_1_index = 0
array_2_index = 0

iterator = 0
new_array = []

while iterator < number_of_iterations
  
  if iterator.even?
    new_array[iterator] = array_1[array_1_index]
    array_1_index = array_1_index + 1
  else
    new_array[iterator] = array_2[array_2_index]
    array_2_index = array_2_index + 1
  end
  
  iterator = iterator + 1
  
end

p new_array