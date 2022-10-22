ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages = { "Spot" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?('Spot')

p ages.include?('Spot')

p ages.member?('Spot')

p ages.fetch('Spot', 'Spot, is not there.')