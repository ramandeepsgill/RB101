a = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
    hash.any? do |key, value|
    value[0] == key.to_s
  end
end

p a
