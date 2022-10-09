# # 02. a method that takes an array of strings, and returns a string that is all
# # those strings concatenated together

# Given an array of strings ['str1', 'str2' ... ]
# final string = 'str1' + 'str2' + 'str3' ...
# return final string

# # more formal pseudo-code
# START

# # Given an array of strings

# iterator = 0

# SET final_string = ''

# WHILE itearator < size of the given array_of_strings
#   final_string = final_string + given_array_of_strings[iterator]
#   iterator = iterator + 1
# END

# PRINT final_string

# END

arr = ['abc', 'def', 'ghi']

iterator = 0
final_string = ""

while iterator < arr.size
  final_string = final_string + arr[iterator]
  iterator = iterator + 1
end

p final_string