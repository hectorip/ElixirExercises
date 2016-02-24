Agent.start(fn -> 1 end, name: Mult)

IO.puts Agent.get(Mult, &(&1))

Agent.update(Mult, &(&1 * 2))

IO.puts Agent.get(Mult, &(&1))
