# Ranges in elixir

# This should be iterable
range_1 = 1..10

range_1 |>
Enum.map(&IO.puts(&1))

# This is not iterable.
# range_a = "a".."z"
# range_a |>
# Enum.map(&IO.puts(&1))