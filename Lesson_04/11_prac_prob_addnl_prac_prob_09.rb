=begin

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"

Input: string
Output: string

Test Case:

Input: "the flintstones rock"
Output: "The Flintstones Rock"

Algorithm:

- Convert the string to an array
- Loop through the array and upcase the first char for each element of the array
- Join the elements of the array

=end


def titleize(str)
  
  arr = str.split
  
  arr.map! do |word|
    word[0].upcase + word[1, (word.length - 1)]
  end
  
  titleized_str = arr.join(' ')
  
end

words = "the flintstones rock"

p titleize(words)

