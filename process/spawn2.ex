defmodule Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end
end

# this is the client

pid = spawn(Spawn2, :greet, [])

send pid, {self, "Wolf!"}

receive do
  {:ok, message} ->
    IO.puts message
end

send pid, {self, "Gallo San"}

receive do
  {:ok, message}->
    IO.puts message
end
