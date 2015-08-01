defmodule Dqs do
  def center(list) do
    lg = get_longest(list, 0)
    print_l(list, lg)
  end
  def print_l([h|t], lg) when h != [] do
    IO.puts String.rjust(h, lg)
    print_l(t, lg)
  end
  def get_longest([], lg), do: lg
  def get_longest([h|t], lg) do
    if String.length(h) >= lg do
      get_longest(t, String.length h)
    else
        get_longest(t, lg)
    end
  end
end
