VALID_CHOICES = {r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock'}

arr = VALID_CHOICES.to_a().flatten()

# p arr


# total_array = rps.to_a.flatten

# p total_array

arr_2 = arr.map {|x| x.to_s.sub(':', '')}

p arr_2

# join_string = remove_colon_array.join(',')

# p join_string

# string_add_for = join_string.gsub(',', ' for ')

# p string_add_for
         





str = ''

i = 0

while i < arr_2.length
  
  if i.even?
    
    str = str + arr_2[i] + ' for '
    
  else
    
    str = str + arr_2[i] + ', '
    
  end
  
  i = i + 1
  
end

p str.delete_suffix(', ')


