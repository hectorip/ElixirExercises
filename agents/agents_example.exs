
{:ok, agent} = Agent.start(fn -> 0 end)

val = Agent.get(agent, &(&1))

IO.puts "Retrieving value from agent"
IO.puts val
