defmodule SB do
  def all_printable(s) do
    all_p(s, true)
  end
  defp all_p([], acc), do: acc
  defp all_p([h|t], acc) do
    acc and all_p(t, h >= 32 and h <= 126)
  end
  def anagram?([],[]), do true
  def anagram?(word1, word2) when word1 == [] or word2 == [], do: false
  end
  def anagram?(word1, word2) do
    [h, word1] = word1
    word2 = word2 -- [h]
    anagram?(word1, word2)
  end
end
