def reset_match_score(p_w, d_w, n_t)
  p_w = 0
  d_w = 0
  n_t = 0
  [p_w, d_w, n_t]
end

player_wins = 5
dealer_wins = 4
no_of_ties = 1

p reset_match_score(player_wins, dealer_wins, no_of_ties)
