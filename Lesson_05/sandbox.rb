# hash = {e: [8], f: [6, 10], g: [1, 3]}

hash = {b: [2, 4, 6], c: [3, 6], d: [4]}

value = hash.all? do |key, value|
    value.all? { |el| el.even? }
end

p value