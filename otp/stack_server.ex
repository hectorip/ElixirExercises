defmodule StackServer do
  use GenServer

  # def handle_call(:init, elements, _) do
    #  { :reply, :ok, elements }
  # end
  def handle_call(:pop, _client, []) do
    {:empty_stack, nil , []}
  end
  def handle_call(:pop, _client, [next|rest]) do
    {:reply, next, rest}
  end
end
