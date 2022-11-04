=begin

One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

...like this:

(Name) is a (age)-year-old (male or female).

Problem Description:

- We have to take the values from each element of the hash and substitute them in a string


Output:

Herman is a 32 year old male.
Lily is a 30 year old female.
...

Algorithm

- call the each method on the munsters hash
- in the block of code with each method, output "'Key' is a 'Value['age']-year-old 'Value['gender']."

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each { |key, value| puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}." }

