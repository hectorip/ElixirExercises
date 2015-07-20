defmodule SumDict do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

hash_test = [one: 1, two: 2, three: 3, four: 4] |> Enum.into HashDict.new
IO.puts SumDict.values(hash_test)

map_test = %{five: 4, six: 6, ten: 10}
IO.puts SumDict.values(map_test)

IO.puts "Playing with Dict API"
# another way to create Maps and hashes

collection = [name: "Héctor", age: 26, language: [:PHP, :Python, :Ruby, :Elixir]]

col_map = Enum.into collection, Map.new
IO.inspect col_map

col_hd = Enum.into collection, HashDict.new
IO.inspect col_hd