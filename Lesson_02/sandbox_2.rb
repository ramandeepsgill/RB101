def fix(value)
  puts "The object id of value is #{value.object_id}"
  #value.upcase!
  value = value.upcase
  value.concat('!')
  puts "The object id of value post operations is #{value.object_id}"
  value
end
s = 'hello'
puts "The value of s before method call is #{s}"
puts "The object id of s before method call is #{s.object_id}"

t = fix(s)
puts "The value of t is #{t}"
puts "The object id of t is #{t.object_id}"

puts "The value of s post method call is #{s}"
puts "The object id of s post method call is #{s.object_id}"