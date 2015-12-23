defmodule StackServer do
  use GenServer

  def handle_call(:pop, _client, []) do
    {:reply, nil , []}
  end
  def handle_call(:pop, _client, [next|rest]) do
    {:reply, next, rest}
  end
end
