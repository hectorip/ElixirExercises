defmodule Dqs do
  def center(list) do
    lg = get_longest(list, 0)
    print_l = fn h -> 
       l = String.length(h) + div(lg-String.length(h), 2)
      IO.puts String.rjust(h, l)
    end
    Enum.each(list, print_l)
  end
  def get_longest([], lg), do: lg
  def get_longest([h|t], lg) do
    if String.length(h) >= lg do
      get_longest(t, String.length h)
    else
        get_longest(t, lg)
    end
  end
  def capitalize_sentences(s) do
    for part <- String.split(s, ". "), do: String.capitalize(part) |>
    List.join(". ")

  end
end
