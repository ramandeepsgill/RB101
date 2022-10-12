  # input the:
  #   1. the loan amount.
  #   2. the annual percentage rate (apr)
  #   3. the loan duration in years
    
  # use the below formula to calculate the monthly payment:
  
  # m = p * (j / (1 - (1 + j)**(-n)))
  
  # check that loan amount is not an empty string or negative
  # check that apr is not an empty string or negative
  # check the number of years is not an empty string or negative
  #
  
  puts "Enter the Loan amount:"
  
  loan_amount = Kernel.gets().chomp().to_f
  
  puts loan_amount
  
  puts "Enter the Loan Annual Percentage Rate (APR),"
  
  prompt_loan_apr = <<-MSG
  (give the actual percent number for e.g. if it
  is 5% APR, enter 5 and not 0.05): 
  MSG
  
  # puts <<-MSG
  # Enter the Loan Annual Percentage Rate (APR),
  # (give the actual percent number for e.g. if it
  # is 5% APR, enter 5 and not 0.05): 
  # MSG
  
  Kernel.puts(prompt_loan_apr)
  
  loan_apr = Kernel.gets().chomp().to_f
  
  puts loan_apr
  
  loan_monthly_int_rate = (loan_apr / 12)/100
  
  puts loan_monthly_int_rate
  
  puts "Enter the loan duration in years:"
  
  loan_duration_months = Kernel.gets().chomp().to_i*12
  
  puts loan_duration_months
  
  term3 = (1 - ((1 + loan_monthly_int_rate)**(-loan_duration_months)))
  
  puts "term3 is #{term3}"
  
  term4 = (1 + loan_monthly_int_rate)**(-loan_duration_months)
  
  puts "term4 is #{term4}"
  
  monthly_payment = loan_amount * (loan_monthly_int_rate/(1 - ((1 + loan_monthly_int_rate)**(-loan_duration_months))))
  
  puts "monthly payment is #{monthly_payment}"
  
  
  
  
  
  