advice = "Few things in life are as important as house training your pet dinosaur."

# pattern = 'Dino'
pattern = 'dino'

index_value = /#{pattern}/ =~ advice

if index_value
  p "'#{pattern}' found at index #{index_value}"
else
  p "'#{pattern}' not found"
end