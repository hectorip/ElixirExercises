
defmodule Geometry do
  # A function signature is composed by his name and the
  # number of arguments it receives.

  def fun(a, b \\ 1, c, d \\ 2) do
    IO.puts a + b + c + d
  end
end
