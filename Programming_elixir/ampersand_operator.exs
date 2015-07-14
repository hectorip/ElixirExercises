# adding 2 to every element in a list
Enum.map [1, 2, 3, 4], fn x -> x + 2 end
new = Enum.map [1, 2, 3, 4], &(&1 + 2)

IO.puts("Second example")

Enum.each [1, 2, 3, 4], fn x -> IO.inspect x end
Enum.each [1, 2, 3, 4], &IO.inspect/1
Enum.each [1, 2, 3, 4], &(IO.inspect &1)

IO.puts("Inspect element created by the first function")
Enum.each new, &(IO.inspect &1)
