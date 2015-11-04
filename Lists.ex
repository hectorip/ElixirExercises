
# common list
prime_numbers = [1, 2, 3, 5, 7]

# Getting the length of a list
IO.puts length(prime_numbers)


# Getting an element of a list
IO.puts Enum.at(prime_numbers, 4)

# Replacing the element 0 for 11
List.replace_at(prime_numbers, 0, 11)

# List.instert_at(prime_numbers, 0, 1)

# Inserting with a negative numbers

List.insert_at(prime_numbers, -1, 13)

other_primes = [17, 19]

# Concatenating
complete_primes = prime_numbers ++ other_primes

# Substract
removing_primes = complete_primes -- [1, 7]

# Head and tail, like a prepend

l1 = [1 | []]
l2 = [1 | [2 | []]]
l3 = [1 | [2,3,4,5]]

hd(l1) # returns head of a list
tl(l1) # returns tail

# Efficient Insertion

my_list = [1, 2, 3]

my_list = [0 | my_list]

# Pair value shortcuts

pair_value_list = [ name: "Héctor", age: 10 ]
IO.puts pair_value_list[:name]
# and you can use
# pair_value_list = [ name: "Héctor", age: 10]


# Difference

a = [1, 2, 3] -- [2]

# Membership
IO.puts (2 in a)