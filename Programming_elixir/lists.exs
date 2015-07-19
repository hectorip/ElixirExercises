defmodule MyList do
    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)

    def mapsum([], _op), do: 0
    def mapsum([head | tail], op), do: op.(head) + mapsum(tail, op)

end

IO.puts("Testing List recursion on Sum")
test_list = [10, 11, 12, 13, 14, 15]
IO.inspect(test_list)
IO.puts(MyList.sum(test_list))

IO.puts("Testing mapsum")
test_list_2 = [1, 2, 3, 4]
IO.inspect(test_list_2)
op = fn x -> x * x end

IO.puts(MyList.mapsum(test_list_2, op))

