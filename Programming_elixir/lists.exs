defmodule MyList do
    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)


end

IO.puts("Testing List recursion on Sum")
test_list = [10, 11, 12, 13, 14, 15]
IO.inspect(test_list)
IO.puts(MyList.sum(test_list))


