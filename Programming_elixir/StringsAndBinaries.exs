defmodule SB do
  def all_printable(s) do
    all_p(s, true)
  end
  defp all_p([], acc), do: acc
  defp all_p([h|t], acc) do
    acc and all_p(t, h >= 32 and h <= 126)
  end
end
