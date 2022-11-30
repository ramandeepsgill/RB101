=begin

Write a method called joinor that will produce the following result:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

input: an array, 2 optional strings
output: string

Rules/Test Cases:
- The method takes 3 arguments: an input array, 'separator' with default value ' ,' , 'last number separator' with default value ' or'
- All the numbers of the input array should be separated by 'separator' except the last number which should be separated by 'last_number_separator'.
- Test Cases are given above.
- Additional Test Case
  - joinor([1])                   # => "1" is this correct to assume?
- 

Steps:
- Intialize variable 'output_string' with an empty string
- from the input array passed as an argument, if the size is greater than 1, loop through the array from the first element to the last but one element, adding the element and the 'separator' to the 'output_string' like >> output_string << "#{elem}#{sepearator} "
- append the string which is made up of the 'last num separator' and the last element of the 'input array' to the 'output_string'
- return the output string

Notes/Sandbox:

=end

def joinor(inp_array, separtor = ', ', last_number_separator = 'or')
  output_string = ''
  last_number = inp_array.last
  if inp_array.empty?
    output_string = ''
  elsif inp_array.size == 1
    output_string = "#{inp_array[0]}"
  elsif (inp_array.size > 1) && (inp_array.size <= 2)
    output_string << "#{inp_array[0]} #{last_number_separator} #{inp_array[1]}"
  else
    index = 0
    loop do 
      break if index == (inp_array.size - 1)
      output_string << "#{inp_array[index]}#{separtor}"
      index +=1
    end
    output_string << "#{last_number_separator} #{last_number}"
  end
end

puts joinor([1, 2, 3])
puts joinor([1, 2])
puts joinor([1, 2, 3], '; ')
puts joinor([1, 2, 3], ', ', 'and')
puts joinor([])
puts joinor([1])