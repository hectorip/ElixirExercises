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

# Obtaining an element is the same
IO.inspect collection[:language]
IO.inspect col_map[:language]
IO.inspect col_hd[:language]

# but you can also replace

col_hd = Dict.drop col_hd, [:language]
IO.puts "Removing Element :language"
IO.inspect col_hd
IO.puts "Adding(put) Element :language"
col_hd= Dict.put col_hd, :language, [:Elixir, :JavaScript]
IO.inspect col_hd