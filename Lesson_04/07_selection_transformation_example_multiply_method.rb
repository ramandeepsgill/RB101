def multiply(num_array, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == num_array.size

    current_number = num_array[counter]
    multiplied_numbers << current_number * multiplier

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]