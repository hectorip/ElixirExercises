
agent = Agent.start_link(fn -> 0 end)

val = Agent.get(agent)

IO.puts "Retrieving value from agent"
IO.puts val
