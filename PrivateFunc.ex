defmodule AModule do

  # Private functions are only visible inside the same module
  defp ThisIsAPrivateFucntion(a,b) do
    IO.puts a + b
  end
end
