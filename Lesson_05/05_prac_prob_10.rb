=begin

Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

Problem Descripton:

Output: [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

Algorithm

- Use the map method on the input array
- In the block (outer level) following the map method pass the hashes as the argument
  - initialize an empty hash
  - use each method on the hashes passed as argument above
  - In the block (inner level) code following each method, use the (key, value) pair to add to the new hash
- 



=end

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

incr_hash = {}

arr2 = arr.map do |hash|
    incr_hash = {}
    hash.each do |key, value|
    incr_hash[key] = value + 1
  end
  incr_hash
end

p arr2