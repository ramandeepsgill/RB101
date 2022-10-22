advice = "Few things in life are as important as house training your pet dinosaur."

# advice.slice!("Few things in life are as important as ")
cut_out_string = advice.slice!(0,advice.index('house'))

p cut_out_string
p advice

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice(0,advice.index('house'))

p advice