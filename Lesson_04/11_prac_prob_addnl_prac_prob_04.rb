=begin

Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Input: hash
Output: print out the name, age of the youngest munster

Test Case:

Input: ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Output: 'Eddie' => 10

Algorithm:

- get all the names in an array
- get all the ages in an array
- set min_age to the first element in the ages array
- set min_age_name to the first element in the names array
- loop from 2nd element to the last element of the ages array or names array
  - in the loop compare the current element to min_age
  - if the age of the current element is less than the value of min_age, assign min_age to the current element from the age array. Also assign min_age_name to the name in the names array which has the same index as the current element of the ages array
- after the loop is done you should have the munster with the min age alongwith their name

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

arr_names = ages.keys
p arr_names

arr_ages = ages.values
p arr_ages

min_age = arr_ages[0]
# p min_age
min_age_name = arr_names[0]
# p min_age_name

for counter in (1..(arr_ages.size - 1))
  # p arr_ages[counter]
  # p min_age
  if arr_ages[counter] < min_age
    min_age = arr_ages[counter]
    min_age_name = arr_names[counter]
  end
end

p min_age
p min_age_name














