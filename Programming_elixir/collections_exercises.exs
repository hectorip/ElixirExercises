
defmodule Enums do
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
  def split_([],_n,acc), do: acc
  def split_([head|tail], n, {left, right}) when n > 0 do
    split_(tail,n-1,{left ++ [head], right})
  end
  def split_(tail, n, {left, right}) when n == 0 do
    {left, right ++ tail}
  end
end