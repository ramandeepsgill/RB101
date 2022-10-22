def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

arr = %w(1 2 3)
max_arr_size = 5
new_elem = 7

p rolling_buffer1(arr, max_arr_size, new_elem)

p arr

arr = %w(1 2 3)
max_arr_size = 5
new_elem = 7

p rolling_buffer2(arr, max_arr_size, new_elem)

p arr