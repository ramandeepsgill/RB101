=begin

Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

Turn this array into a hash where the names are the keys and the values are the positions in the array.

input: array
output: hash

input: flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
output: { "Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4,"BamBam" => 5}

Algorithm 1:

- create a new empty hash
- create a counter and intialize to 0
- loop through through the input array
 - new_hash[input_array[counter]] = counter
 - increment the counter
 - break the loop when counter == size of the input array
- return the new_hash

Algorithm 2:

- create a new empty hash, h
- use 'each_with_index' method
- in the block of code, h[index] = elem of the array
- print h

=end

def hash_from_array(arr)
  hsh = {}
  counter = 0
  
  loop do
    break if counter == arr.size
    hsh[arr[counter]] = counter
    counter += 1
  end
  
  hsh
  
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p hash_from_array(flintstones)

h = {}

flintstones.each_with_index { |name, index| h[name] = index }

p h

  
  