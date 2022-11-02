=begin

Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Input = hash
Output = integer

Example

Input: ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Output: 6174 # 32 + 30 + 5843 + 10 + 22 + 237

Algorithm
===========

- Initialize sum_of_ages = 0
- Use each_value method
- in the block do sum = sum + age
- return sum_of_ages

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_of_ages = 0

ages.each_value { |age| sum_of_ages = sum_of_ages + age }

p sum_of_ages