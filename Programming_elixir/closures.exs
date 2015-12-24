
# You can  store an anonymous function in a variable
# but when oyu call it you should add a dot before
# parentheses.

greet = fn name ->
  fn ->
    IO.puts "Hello #{name}"
  end
end

greet_hector = greet.("Hector")

greet_hector.()


# Closures can also be declared because they
# stores their context

multiplicator = 2

double = fn n ->
  n * multiplicator
end

multiplicator = 3

triple = fn n ->
  n * multiplicator
end

IO.puts double.(2)
IO.puts triple.(2)