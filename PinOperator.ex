#name = "Bob"

{name, age} = {"Bobo", 25}
IO.puts name
IO.puts age
{name, age} = {"Bobo", 23}
x = 2
{x, ^x} = {1,2}
# the above line is strange, first Elixir checks if the right side
# is a variable and can do an assignment, in this case we are able to
# do that, but the "^x" part takes x = 2, because the first part is not
# concreted yet or it has not consequences until now. Thus, the Matching succeed
# and the asignment is done, transforming x into 1.
# Crazy.

# This works and if the pattern matching is right, it will assign
# the value to the variable after finishing the check of all
IO.puts "X is #{x}" # X must be 1
IO.puts name
IO.puts age
