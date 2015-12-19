defmodule SequenceServer do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number + 1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number + delta }
  end

  def handle_cast({:decrement_number, delta}, current_number) do
    { :noreply, current_number - delta } # returns only :noreply and the state of the server
  end

  def run_with_debug(initial_state) do
    GenServer.start_link(__MODULE__, initial_state, [debug: [:trace, :statistics]])
    # statistics can be checked with :sys.statistics pid, :get
  end
end


