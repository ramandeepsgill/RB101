arr = ["r", "rock", "p", "paper", "s", "scissors"]

str = ''

i = 0

while i < arr.length
  
  if i.even?
    
    str = str + arr[i] + ' for '
    
  else
    
    str = str + arr[i] + ', '
    
  end
  
  i = i + 1
  
end

p str.delete_suffix(', ')