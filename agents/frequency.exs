defmodule Frequency do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add_word(word) do
    Agent.update(__MODULE__, 
    fn state ->
      Map.update(state, word, 1, &(&1 + 1))
    end)
  end

  def count_for(word) do 
    Agent.get(__MODULE__, fn state -> Map.get(state, word, 0) end )
  end

  def words do
    Agent.get(__MODULE__, fn state -> Map.keys(state) end)
  end
end
