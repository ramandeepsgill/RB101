# # 01. A method that returns the sum of two integers

# - Ask the user to input the first integer.
# - Ask the user to input the second integer.
# - Add the 2 integers.
# - Return the sum of teh 2 integers.

# More formal pseudo-code

# START

# GET first integer
# SET number_1 = first integer.
# GET second integer
# SET number_2 = second integer.
# SET sum = number_1 + number_2
# PRINT sum

# END

puts "Enter the first integer: "
number_1 = Kernel.gets().chomp().to_i()

puts "Enter the second integer: "
number_2 = Kernel.gets().chomp().to_i()

sum = number_1 + number_2

puts "The sum of the integers is #{sum}"

