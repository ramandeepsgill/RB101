arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

result = arr.sort_by do |arr|
  arr.map do |num|
    num.to_i
  end
end

# Tesing some what-if cases

# result = arr.map do |arr|
#   arr.map do |num|
#     num.to_i
#   end
# end

# result = arr.sort_by do |arr|
#   arr.map do |str|
#     str
#   end
# end

p result