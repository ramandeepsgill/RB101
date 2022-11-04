=begin

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

Problem Description:

- The input array is a nested array of hashes
- each hash has multiple key values for the book
- we have to sort the book hashes by the key published:


Algorithm:

- Use sort_by and within the block for the hash argument, use hash[:published].to_i as the criteria for sorting

=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books_sorted_by_publication_date = books.sort_by { |hash| hash[:published].to_i }

p books_sorted_by_publication_date