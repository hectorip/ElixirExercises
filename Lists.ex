prime_numbers = [1,2,3,5,7]

IO.puts length(prime_numbers)

IO.puts Enum.at(prime_numbers, 4)

List.replace_at(prime_numbers, 0, 11)

List.instert_at(prime_numbers, 0, 1)

# Inserting with a negative numbers

List.insert_at(prime_numbers, -1, 13)

other_primes = [17, 19]

# Concatenating
complete_primes = prime_numbers ++ other_primes

# Head and tail, like a prepend

l1 = [1 | []]
l2 = [1 | [2 | []]]
l3 = [1 | [2,3,4,5]]

hd(l1) # returns head of a list
tl(l1) # returns tail

