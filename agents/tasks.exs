defmodule Fib do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: of(n-1) + of(n-2)
end

IO.puts "Calling Task"
task = Task.async(fn -> Fib.of(37) end)


IO.puts "Doing other things"
IO.puts Task.await(task)
