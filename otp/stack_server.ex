defmodule StackServer do
  use GenServer
  def start_link(state)
end
  def handle_call(:pop, _client, []) do
    {:reply, nil , []}
  end
  def handle_call(:pop, _client, [next|rest]) do
    {:reply, next, rest}
  end
  def handle_cast({:push, element_to_push}, stack) do
    {:noreply, [ element_to_push | stack ]}
  end
end
