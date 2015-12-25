'''
Streams are lazy iterable objects. The collection or the next
element is generated just in time when it is required by the program.
So, Streams allow us to work with potentially infinite sets
of elements without exhausting our memory.
'''

stream = 1..100
|> Stream.map(fn(x) -> x*x end)

my_l = Enum.to_list(stream)

IO.puts(Enum.at(my_l,5))
IO.inspect(Enum.take(stream, 3))
