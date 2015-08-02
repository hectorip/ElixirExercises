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
    (for part <- String.split(s, ". "), do: String.capitalize(part)) |>
    Enum.join(". ")
  end
  def parse(csv) do
    file = File.open!(csv)
    IO.read(file, :line)
    for line <- IO.stream(file, :line) do
      [id, ship_to, net_amount] = String.split(line,",")
      {id, _} = Integer.parse(id)
      {net_amount, _} = Float.parse(net_amount)
      <<_::utf8,ship_to::binary>> = ship_to
      [id: id, ship_to: String.to_atom(ship_to), net_amount: net_amount]
    end
  end
end
