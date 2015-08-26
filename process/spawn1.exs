defmodule Spawn1 do
  def greet do
    :random.seed(:erlang.now) 
    r = Enum.at([:ok,:error], :random.uniform(2)-1)
    receive do
      {sender, msg} ->
        send sender, { r, "Hello, #{msg}" }
    end
  end
end

#client

pid = spawn(Spawn1, :greet, [])
send pid, { self, "World!" }

receive do 
  {:ok, message} ->
    IO.puts message
  {:error, message } ->
    IO.puts "Error: " <> message
end
