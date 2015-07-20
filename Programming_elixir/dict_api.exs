defmodule SumDict do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

hash_test = [one: 1, two: 2, three: 3, four: 4] |> Enum.into HashDict.new
IO.puts SumDict.values(hash_test)

map_test = %{five: 4, six: 6, ten: 10}
IO.puts SumDict.values(map_test)