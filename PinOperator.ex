#name = "Bob"

{name, age} = {"Bobo", 25}
IO.puts name
IO.puts age
{name, age} = {"Bobo", 23}
x = 2
{x, ^x} = {1,2}
# Now this works and if the pattern matching is right, it will assign
# the value to the variable after finishing the check of all
IO.puts "X is #{x}" # X must be 1
IO.puts name
IO.puts age
