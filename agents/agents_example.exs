
{:ok, agent} = Agent.start(fn -> 1 end)

val = Agent.get(agent, &(&1))

IO.puts "Retrieving value from agent"
IO.puts val

IO.puts "Retrieving and updating"
Agent.update(agent, &(&1*10))
IO.puts Agent.get(agent, &(&1))

