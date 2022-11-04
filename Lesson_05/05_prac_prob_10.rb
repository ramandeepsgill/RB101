=begin

Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

Problem Descripton:

Output: [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

Algorithm



=end

# array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# array.map do |hsh|
#   # incremented_hash = {}
#   hsh.each do |key, value|
#     hsh[key] = value + 1
#   end
#   # incremented_hash
# end
# # => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# p array

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

array.map do |hsh|
  # incremented_hash = {}
  hsh.map do |key, value|
    value = value + 1
  end
  # incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

p array