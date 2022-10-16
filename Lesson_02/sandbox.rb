rps = {r: 'rock', p: 'paper', s: 'scissors'}

p rps.has_key?()

total_array = rps.to_a.flatten

p total_array

remove_colon = total_array.map {|x| x.to_s.sub(':', '')}

p remove_colon

join_string = remove_colon.join(',')

p join_string

string_add_for = join_string.gsub(',', ' for ')

p string_add_for
         
rps_array = rps.values

p rps_array

p rps_array.sample


