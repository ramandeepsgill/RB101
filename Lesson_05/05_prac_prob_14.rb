=begin

Given this data structure write some code to return an array containing the colors of the fruits, and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

Algorithm

- initialize an empty array
- run the each (level 1) method on the given hash
- in the block for each method call for each method (level 2) again to access the inner hash
- In the block for level 2 each method, with (key, value) pairs use the if conditional to captitalize the the value of colors if the value is fruit and add it to the array created in the beginning, using the elsif conditional upcase the value of size if the value is fruit and add it to the array created in the beginning

=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do |key1, value1|
  value1.each do |_, value2|
    if value2 == 'fruit'
      fruit_colors_capitalized = (value1[:colors].map { |str| str.capitalize })
      arr << fruit_colors_capitalized
    elsif value2  == 'vegetable'
      arr << value1[:size].upcase
    end
  end
end

p arr


