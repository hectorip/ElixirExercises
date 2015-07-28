
defmodule Enums do
  def all?(list, _f \\ fn x -> !!x end )
  def all?([],_f), do: false
  def all?(list, f) do
    _all(list, f, true)
  end
  defp _all([], _f, acc), do: acc
  defp _all([head|tail], f, acc) do
    _all(tail, f, f.(head) and acc)
  end
  def each([], _f), do: :ok
  def each([head|tail], f) do
    f.(head)
    Enums.each(tail,f)
  end
  def filter([], _f), do: []
  def filter([head|tail], f) do 
    if f.(head) do
      [head] ++ filter(tail, f)
    else
      filter(tail, f)
    end
  end
  def split(col, n) do
    split_(col,n,{[],[]})
  end
  defp split_([],_n,acc), do: acc
  defp split_([head|tail], n, {left, right}) when n > 0 do
    split_(tail,n-1,{left ++ [head], right})
  end
  defp split_(tail, n, {left, right}) when n == 0 do
    {left, right ++ tail}
  end
  def take([], _n), do: []
  def take(_c, 0), do: []
  def take([head|tail], n) when n > 0 do
    [head] ++ take(tail, n-1)
  end
  def flatten(col) do
    flatten_(col, [])
  end
  defp flatten_([], acc), do: acc
  defp flatten_([head = [_h|_t]|tail], acc) do
   flatten_(head, []) ++ flatten_(tail, acc)
  end
  defp flatten_([[]|tail], acc) do
    flatten_(tail, acc)
  end
  defp flatten_([head|tail], acc) do
    [head| flatten_(tail,acc)]
  end
  def span(from, to) when from <= to, do: [from] ++  span(from + 1, to)
  def span(from, to), do: []
  def prime(2), do: []
  def prime(n) do
    range = for x <- span(2,n), y <-[(for z <- span(2, x-1), rem(x, z)==0, do: z)], length(y) == 0, do: x
  end
end