# input the:
#   1. the loan amount.
#   2. the annual percentage rate (apr)
#   3. the loan duration in years
# use the below formula to calculate the monthly payment:
#
# m = p * (j / (1 - (1 + j)**(-n)))
#
# check that loan amount is not an empty string or negative
# check that apr is not an empty string or negative
# check the number of years is not an empty string or negative
#
# Pseudo-Code
# - Prompt the user for loan amount and check that the user does
# not enter an empty string or a negative number using a do loop
# - Prompt the user for APR and check that the user does
# not enter an empty string or a negative number using a do loop
# - Prompt the user for loan duration in years and check that the user does
# not enter an empty string or a negative number using a do loop
# - calculate the monthly loan payment
# - Ask the user if they want to calculate another monthly payment
def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number > 0.0
end

prompt("The Mortgage Calculator")
puts("============================")

loan_amt = 0.0
loan_apr = 0.0
loan_dur = 0.0

loop do # main loop
  loop do
    # for loan amount
    prompt("Loan Amount:")
    loan_amt = gets().chomp().gsub(/,/, '').to_f()
    if valid_number?(loan_amt)
      break
    else
      prompt("Please enter a number > 0.0")
    end
  end
  # puts("loan amount is #{loan_amt}")
  loop do
    # for APR
    prompt("Loan APR % (for e.g if it is 3.5% enter 3.5 and not 0.035):")
    loan_apr = gets().chomp().to_f() / 100
    if valid_number?(loan_apr)
      break
    else
      prompt("Please enter a number > 0.0")
    end
  end
  # puts("loan APR is #{loan_apr} %")
  loop do
    # for duration
    prompt("Loan duration in years:")
    loan_dur = gets().chomp().to_f()
    if valid_number?(loan_dur)
      break
    else
      prompt("Please enter a number > 0.0")
    end
  end
  loan_apr_monthly = loan_apr / 12
  loan_dur_months = loan_dur * 12
  # m = p * (j / (1 - (1 + j)**(-n)))
  #
  # m = monthly payment
  # p = loan amount
  # j = monthly interest rate
  # n = loan duration in months
  exponential_term = (1 + loan_apr_monthly)**(-loan_dur_months)
  # prompt("exponential term is #{exponential_term}")
  denominator_term = 1 - exponential_term
  # prompt("denominator term is #{denominator_term}")
  monthly_payment = loan_amt * (loan_apr_monthly / denominator_term)
  prompt("monthly payment is $#{format('%.2f',monthly_payment)}")
  prompt("Do you want to use the Mortgage Calculator again?")
  calc_again = gets().chomp().downcase()
  break if !calc_again.start_with?('y')
end

prompt("Thanks for using the Mortgage Calculator!")
