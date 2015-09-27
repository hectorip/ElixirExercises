defmodule Spawn4 do
  def greet do
    receive do
      {sender, message} ->
        send sender, {:ok, "Hello, #{message}"}
        greet
    end
  end
end

pid = spawn(Spawn4, :greet, [])
send pid, {self, "Wolf!"}

receive do
  {:ok, message} ->
    IO.puts message
end

send pid, {self, "Pupu!"}
receive do
  {:ok, message} ->
    IO.puts message
  after 500 ->
    IO.puts "The Greeter has gone away"
end
