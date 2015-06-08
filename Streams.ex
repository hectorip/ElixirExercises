stream = 1..100
|> Stream.map(fn(x) -> x*x end)

my_l = Enum.to_list(stream)

IO.puts(Enum.at(my_l,5))
IO.inspect(Enum.take(stream, 3))
