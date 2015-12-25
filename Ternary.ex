# This is the way we implement a ternary operator in
# Elixir. The && and || operators are not strict logic
# Operators, so they accept all types of values and try
# to evaluate it as a boolean

myvalue = false && "this_must not be" || "this must be"
IO.puts myvalue
