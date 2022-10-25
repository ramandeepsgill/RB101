greetings = { a: 'hi' }
informal_greeting = greetings[:a]

puts "object id of informal_greeting is #{informal_greeting.object_id}"
puts "object id of greetings is #{greetings[:a].object_id}"

informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings