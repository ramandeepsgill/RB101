
def prompt(message)
  Kernel.puts("=> #{message}")
end

a = <<-MSG
    Enter the Loan Annual Percentage Rate (APR),
    (give the actual percent number for e.g. if it
    is 5% APR, enter 5 and not 0.05): 
  MSG

prompt(a)
