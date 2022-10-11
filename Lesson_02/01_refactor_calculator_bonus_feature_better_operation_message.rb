# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i().to_s() == input
end

def float?(input)
  input.to_f().to_s() == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(oper)
  word = case oper
         when '1'
            'Adding'
         when '2'
            'Subtracting'
         when '3'
            'Multiplying'
         when '4'
            'Dividing'
         end
  x = "If you want to add more code"
  word
end

prompt("Welcome to the Calculator! Enter your name")

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt("Hmm ... that does not look like a valid number")
    end
  end
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt("Hmm ... that does not look like a valid number")
    end
  end
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1. add
    2. subtract
    3. multiply
    4. divide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end
  prompt("#{operation_to_message(operator)} the two numbers ...")
  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end
  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator.")
