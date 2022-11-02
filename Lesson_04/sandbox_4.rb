a = {'foo' => 0, 'bar' => 1, 'baz' => 2}

output_1 = a.find_all {|key, value| key.start_with?('b') }

output_2 = a.select {|key, value| key.start_with?('b') }

p "using 'find_all' method the output is #{output_1}"

p "using 'select' method the output is #{output_2}"