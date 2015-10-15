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
end
