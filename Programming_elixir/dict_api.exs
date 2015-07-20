defmodule SumDict do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

hash_test = [one: 1, two: 2, three: 3, four: 4] |> Enum.into HashDict.new
IO.puts SumDict.values(hash_test)