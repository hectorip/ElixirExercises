
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
end