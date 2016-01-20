defmodule Spawn1 do
  import :timer, only: [sleep: 1]
  def greet do
    :timer.sleep 2000
    IO.puts "Finished"
  end
end

#client

pid = spawn(Spawn1, :greet, [])

IO.puts "Main finished"
