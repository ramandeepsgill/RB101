def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid_simplified(color)
  (color == "blue" || color == "green") ? true : false
end

puts color_valid('green')

puts color_valid_simplified('blue')