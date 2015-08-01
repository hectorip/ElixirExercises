defmodule Dqs do
  def center(list) do
    lg = get_longest(list, 0)
    for w <- lg, do: IO.puts(String.rjust(w,lg))
  end
  def get_longest(_l, lg), do: lg
  def get_longest([h|t], lg) when String.length h >= lg do
    get_longest(t, String.length h)
  end
  def get_longest([h|t], lg) when String.length h >= lg do
    get_longest(t, lg)

  end
end
