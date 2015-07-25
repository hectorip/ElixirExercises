
defmodule Enums do
  def all?([],_f), do: false
  def all?(list, f) do
    _all(list, f, true)
  end
  defp _all([], _f, acc), do: acc
  defp _all([head|tail], f, acc) do
    _all(tail, f, f.(head) and acc)
  end
end