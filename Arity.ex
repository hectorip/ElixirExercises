
defmodule Geometry do
  # A function signature is composed by his name and the
  # number of arguments it receives.

  def fun(a, b \\ 1, c \\ 2, d \\ 2) do
    IO.puts a + b + c + d
  end

  def fun() do
    IO.puts "Soy rapero"
  end
end
