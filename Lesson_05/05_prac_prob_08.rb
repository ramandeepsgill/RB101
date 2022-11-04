=begin

Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

Algorithm:

- separate the values of the hash into a separate array

[['the', 'quick'], ['brown', 'fox'], ['jumped'], ['over', 'the', 'lazy', 'dog']]

- each method on the above array to get the sub-arrrays
- for each sub-array in the block of code, split the elements of the sub-array into char arrays
- iterate through the char array and add all the vowels that you find to an empty array

=end

VOWEL_STRING = 'aeiouAEIOU'
vowels = []

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh_values = hsh.values

# p hsh.values

hsh_values.each do |arr|
  arr.each do |str|
   char_array = str.chars
  # p char_array
   char_array.each do |char|
     vowels << char if VOWEL_STRING.include?(char)
   end
  end
end

p vowels
