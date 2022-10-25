def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
end

def tricky_method_2(a_string_param)
  a_string_param += "rutabaga"
end

def tricky_method_3(an_array_param)
  an_array_param += ["rutabaga"]
end

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]

puts "The object id of my_string before method call is #{my_string.object_id}"
puts "The object id of my_array before method call is #{my_array.object_id}"

my_string = tricky_method_2(my_string)

my_array = tricky_method_3(my_array)

my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "The object id of my_string after method call is #{my_string.object_id}"
puts "The object id of my_array after method call is #{my_array.object_id}"

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

