defmodule Parallel do
  def pmap(collection, fun) do
    me = self # this is because self word would take a nother meaning inside the spawned function
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, {self, fun.(elem) }) end
    end)
    |> Enum.map(fn (pid) ->
      receive do { ^pid, result } -> result end
    end)
    # now I understand
  end

  def bad_pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> send me, { self, fun.(elem) } end
    end)
    |> Enum.map(fn (_pid) ->
      receive do { _, result } -> result end
    end)
  end # This will fail if the function has different response times
end
