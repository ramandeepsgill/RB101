# require "pry"
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

number = 10

if number <= 0
  puts "The number for which you are finding the factors should be greater than 0"
else
  p factors(number)
end
