defmodule Dictionary do

  @name __MODULE__

  # External API
  def start_link,
  do: Agent.start_link(fn -> %{} end, name: @name)

  def add_words(words),
  do: Agent.update(@name, &do_add_words(&1, words))

  def anagrams_of(word),
  do: Agent.get(@name, &Dict.get(&1, signature_of(word)))

  # Internal implementation
  defp do_add_words(dict, words),
  do: Enum.reduce(words, dict, &add_one_word(&1, &2))

  defp add_one_word(word, dict),
  do: Dict.update(dict, signature_of(word), [word], &[word|&1])

  defp signature_of(word),
  do: word |> to_char_list |> Enum.sort |> to_string

end
