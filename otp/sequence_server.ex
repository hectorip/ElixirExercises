defmodule SequenceServer do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number_ + 1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end
end
