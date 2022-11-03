# Return value of if

a = 11

if a < 10
  puts "a is less than 10"
elsif a == 10
  puts "a is equal to 10"
else
  puts "a is greater than 10"
end
  
# Return value of while

counter = 0 

while counter < 3
  puts counter
  counter += 1
end

# Return value of loop

counter = 0

loop do
  break if counter == 3
  puts counter
  counter += 1
end

# Return value of until

counter = 5 

until counter < 0
  puts counter
  counter = counter - 1
end

# Return value of unless

a = 4

unless a > 5
  puts a
end

# Return value of for loop

for counter in (1..4)
    puts counter
end

