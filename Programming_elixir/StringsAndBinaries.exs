defmodule SB do
  def all_printable(s) do
    all_p(s, true)
  end
  defp all_p([], acc), do: acc
  defp all_p([h|t], acc) do
    acc and all_p(t, h >= 32 and h <= 126)
  end
  def anagram?([],[]), do: true
  def anagram?(word1, word2) when word1 == [] or word2 == [], do: false
  def anagram?(word1, word2) do
    [h | word1] = word1
    word2 = word2 -- [h]
    anagram?(word1, word2)
  end
  def calculate(calc) do
    _calc(calc, [])
  end
  defp _calc([h|t], acc) when h in '+-*/' do
    
  end
  defp _calc([h|t], acc) do
    _calc(t, acc ++ [h])
  end
  
end
  [ 'cat' | 'dog' ]
  # It prints that because the first element is a list inside the list
  # the head element is always a single element of the list.
  # ['cat',100,111,103]
