=begin

In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

remove people with age 100 and greater.

Input: hash
Output: hash

Test Case: 

Input: ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

Output: ages = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

Algorithm

- use the reject! or delete_if to mutate the hash

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! { |_, value| value >= 100 }

p ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, value| value >= 100 }

p ages