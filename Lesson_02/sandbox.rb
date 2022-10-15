hash = {lizard: ['paper', 'spock'], 
         paper: ['rock', 'spock']}
p hash
p hash[:lizard].include?('paper')
p hash[:lizard].include?('rock')