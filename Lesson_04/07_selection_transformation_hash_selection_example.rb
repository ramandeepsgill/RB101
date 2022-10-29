=begin

Problem: Let's now take a look at an example with hashes. In this example we want to select the key-value pairs where the value is 'Fruit'.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

Algorithm:

- Create an empty hash {} called select_produce
- Iterate through the hash
- check each key-value pair and if value is 'Fruit' add it to the hash select_produce
- return the hash select_fruit

=end

def select_fruit(produce_list)
  
  selected_fruits = {}
  produce_keys = produce_list.keys
  
  counter = 0
  
  loop do
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end
    
    counter += 1
    
  end
  
  selected_fruits
  
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}