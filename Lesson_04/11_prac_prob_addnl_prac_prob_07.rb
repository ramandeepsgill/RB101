=begin

Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

Input: String
Output: Hash

Test Case: 

Input: "The Flintstones Rock"

Output: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

Algorithm:

- Create an array out of the give string e.g. ['The', 'Flintstones', 'Rock']
- Join the elements of the array e.g. 'TheFlintstonesRock'
- Split the string 'TheFlintstonesRock' into individual chars e.g [T, h, e, F, l ...]
- Find the uniq values in the char array and store them in a separate array
- Initialize a new empty hash
- For each char in the uniq array loop through the char array.
    - In each iteration count the number of characters that match the character in the uniq array
    - Create a hash key, value pair where hash[char in uniq array] = count of the same char in the char array

=end

statement = "The Flintstones Rock"

char_array = statement.split.join.chars

p char_array

uniq_array = char_array.uniq.sort

p uniq_array

freq_hash = {}

uniq_array.each do |uniq_char|
  freq_hash[uniq_char] = char_array.count(uniq_char)
end

p freq_hash
  

