# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin

input: string
output: array

rules:

Explicit Rules:

- extract all the palindromes from the given string (reminder: palindrome is a word that reads the same forward and backward.)
- palindromes are case sensitive so 'mom' is a palindrome but 'Mom' is not.


Implicit Rules:

- All the palindromes extracted from the given string are written out as elements of an array 
- if there is no palindrome in the given string write out an empty array
- if the given string is empty write out an empty array
- a palindrome within a larger palindrome is also considered a palindrome on its own and writte out as a separate element of the array output

First version of pseudocode
============================

# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array

Second version of pseudocode
=============================

# START
#
#   /* Given a string named `string` */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET num_chars = 2
#     WHILE num_chars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index + 1
#
#   RETURN result
#
# END


=end

def substrings(str)
  result = []
  starting_index = 0
  
  while (starting_index <= (str.size - 2))
    num_chars = 2
    while (num_chars <= (str.size - starting_index))
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  
  result
  
end

p substrings('goalies')