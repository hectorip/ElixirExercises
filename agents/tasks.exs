defmodule Fib do
  of(0), do: 0
  of(1), do: 1
  of(n), do: of(n-1) + of(n-2)
end

IO.puts "Calling Task"
task = Task.start_link(Fib.of(37))


IO.puts "Doing other things"
IO.puts Task.await(task)
