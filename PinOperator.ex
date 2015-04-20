#name = "Bob"

{name, age} = {"Bobo", 25}
IO.puts name
IO.puts age
{name, age} = {"Bobo", 23}
x = 2
{x, ^x} = {2,1}
IO.puts "X is #{x}"
IO.puts name
IO.puts age
