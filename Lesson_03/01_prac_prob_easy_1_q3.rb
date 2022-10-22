advice = "Few things in life are as important as house training your pet dinosaur."

array = advice.split()

p array

array.each_index do |index|
  array[index] = 'urgent' if array[index] == 'important'
end

p array.join(' ')

# More Efficient Way

advice.gsub!('important', 'urgent')

p advice