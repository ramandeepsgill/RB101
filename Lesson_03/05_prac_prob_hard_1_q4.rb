=begin

Defining the method 'is_an_ip_number?'

Algorithm:

- Convert the string to a number
- Check if the number is between 0 and 255 

=end

def is_an_ip_number?(word)
  if (word.to_i.to_s == word) && (word.to_i >= 0 && word.to_i <= 255)
    true
  else
    false
  end
end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

puts dot_separated_ip_address?('10.4.5.11')
puts dot_separated_ip_address?('10.400.50.6')
puts dot_separated_ip_address?('0.0.0.0')
puts dot_separated_ip_address?('255.255.255.255')
puts dot_separated_ip_address?('10.4.5.hi')
puts dot_separated_ip_address?('10.20.30')
puts dot_separated_ip_address?('10.20.30.40.50')