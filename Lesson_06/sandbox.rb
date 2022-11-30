# def reset_match_score(player_wins, dealer_wins, no_of_ties)
#   player_wins = 0
#   dealer_wins = 0
#   no_of_ties = 0
#   [player_wins, dealer_wins, no_of_ties]
# end

# def reset_match_score(player_wins, dealer_wins, no_of_ties)
#   player_wins = 0
#   dealer_wins = 0
#   no_of_ties = 0
#   [player_wins, dealer_wins, no_of_ties]
# end

# def reset_match_score(p_w, d_w, n_t)
#   p_w = 0
#   d_w = 0
#   n_t = 0
#   [p_w, d_w, n_t]
# end

# def reset_match_score(p_w, d_w, n_t)
#   a = p_w + d_w + n_t
#   p_w = 0
#   d_w = 0
#   n_t = 0
#   [p_w, d_w, n_t, a]
#   # [p_w, d_w, n_t]
# end

# def reset_match_score(player_wins, dealer_wins, no_of_ties)
#   player_wins -= player_wins
#   dealer_wins -= dealer_wins
#   no_of_ties -= no_of_ties
#   [player_wins, dealer_wins, no_of_ties]
# end

# def reset_match_score(plyr_wins, dlr_wins, ties)
#   # plyr_wins = 0
#   # dlr_wins = 0
#   # ties = 0
#   # [plyr_wins, dlr_wins, ties]
#   plyr_wins + dlr_wins + ties
# end

def reset_match_score
  p_w = 0
  d_w = 0
  n_t = 0
  [p_w, d_w, n_t]
end

# player_wins = 5
# dealer_wins = 4
# no_of_ties = 1

player_wins = 5
dealer_wins = 4
no_of_ties = 1

# p reset_match_score(player_wins, dealer_wins, no_of_ties)
p reset_match_score
player_wins, dealer_wins, no_of_ties = reset_match_score
p player_wins
p dealer_wins
p no_of_ties

