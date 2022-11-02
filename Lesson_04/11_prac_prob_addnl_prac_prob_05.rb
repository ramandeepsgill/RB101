=begin

In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Find the index of the first name that starts with "Be"

Input: Array
Output: Integer

Test Case

Input = %w(Fred Barney Wilma Betty BamBam Pebbles)
Output = 3

Algorithm:

- Use the each method to interate through the array
  - for each element check if it starts with 'Be'
  - for the element that starts with 'Be' store the value in index
  
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

id = 0

flintstones.each_with_index do |name, index|
   if name.start_with?('Be')
    id = index
    break
  end
end

p id
