# # 04. a method that determines the index of the 3rd occurrence of a given character 
# # in a string. For instance, if the given character is 'x' and the string is 
# # 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). 
# # If the given character does not occur at least 3 times, return nil.

# Given a string
# Given a character which needs to be found in the string
# Split the strings into an array of single characters
# Initialize a counter
# Initialize a variable called index
# Iterate through the array
# - check if the given character is in the array
# - for every instance of the character found in the array, increment the 
# counter by 1, and store the index at which the character is found in the
# variable index
# - if the counter reaches 3, break out of the loop and return the value of index
# - if the counter is less than 3 after iterating through the array, return nil

# # more formal pseudo-code

# START

# # Given a string
# # Given a character which needs to be found in the string

# SET array_chars = split the given string into an array
# SET char_to_check = given character

# SET counter = 0
# SET index = nil
# SET iterator = 0

# WHILE iterator < length of array_chars
#   set current_char = value within array_chars at space 'iterator'
#   IF char_to_check == current_char
#     index = iterator
#     counter = counter + 1
#   END
#   IF counter == 3
#   BREAK
#   END
  
#   iterator = iterator + 1
# END

# IF counter == 3
#   PRINT the value of index
# ELSE
#   PRINT nil
# END

# END

str = 'axbxcdxex'
char_to_check = 'c'

array_chars = str.each_char.to_a

p array_chars

p "char to find for 3 occurances is #{char_to_check}"

counter = 0
index = nil
iterator = 0

while iterator < array_chars.size
  current_char = array_chars[iterator]
  if char_to_check == current_char
    index = iterator
    counter = counter + 1
  end
  if counter == 3
    break
  end
  
  iterator = iterator + 1
  
end

if counter == 3
  puts "The index of 3rd occurance of #{char_to_check} is #{index}"
else
  p nil
end