defmodule Stack.Stash do
  use GenServer
  
  # Interface
  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end
  def get_value(pid) do
    GenServer.call pid, :get_value
  end
  def set_value(pid, value) do
    GenServer.cast pid, {:save_value, value}
  end

  #GenServer Implementation

  def init(initial_state) do
    {:ok, initial_state}
  end
  def handle_call(:get_value, _client, state) do
    {:reply, state, state}
  end
  def handle_cast({:save_value, new_value}, _state) do
    {:noreply, new_value}
  end
end
