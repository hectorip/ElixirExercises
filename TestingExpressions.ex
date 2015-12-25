defmodule Hello do
  # this is executed only when the file is being compiled
  IO.puts "Defining function world"
  def world do
    IO.puts "Halloooo"
  end
  # this too
  IO.puts "Function world defined"
end
