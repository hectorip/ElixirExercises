square = fn(x) -> x * x end


# The point after the name is important, and it's not used on named functions
IO.puts square.(5)

# You can also omit the parenthesis

puts_sum = fn a, b -> IO.puts a + b end

puts_sum.(5, 4)

# and you can omit the parenthesis whe you have no arguments

greet = fn -> IO.puts "Hello! Elixir" end

greet.()

# But you could also invoke the anonymous function inmediately

(fn -> IO.puts "Bye!" end).()

# This is awesome