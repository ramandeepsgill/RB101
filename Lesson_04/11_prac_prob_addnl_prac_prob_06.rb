=begin

Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Input: Array
Output: Array

Test Case

Input: flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Output: flintstones = %w(Fre Bar Wil Bet Bam Peb)

Algorithm:

- Use map! method
- for the block use name[0, 3]

=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
p flintstones