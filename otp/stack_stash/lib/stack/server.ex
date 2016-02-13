defmodule Stack.Server do
  use GenServer
  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: :stack_server)
  end
  def init(stash_pid) do
    current_stash = Stack.Stash.get_value stash_pid
    {:ok, {current_stash, stash_pid}}
  end
  def pop() do
    GenServer.call(:stack_server, :pop)
  end
  def push(element) do
    GenServer.cast(:stack_server, {:push, element})
  end
  def cause_error() do
    GenServer.call(:stack_server, :push)
  end


  def handle_call(:pop, _client, {[], stash_pid}) do
    {:reply, nil , {[], stash_pid}}
  end
  def handle_call(:pop, _client, {[next|rest], stash_pid}) do
    {:reply, next, {rest, stash_pid}}
  end
  def handle_call(:push, _client , state) do
    {:stop, "WE received push as call", state}
    # raise "Received 10"
  end
  def handle_cast({:push, n}, _state) when n < 10 do
    System.halt n
  end
  def handle_cast({:push, element_to_push}, {stack, stash_pid}) do
    {:noreply, {[ element_to_push | stack ], stash_pid}}
  end
  def terminate(reason, {stack, stash_pid}) do
    IO.puts "Terminating Message"
    IO.inspect reason
    IO.inspect stack
    Stack.Stash.set_value stash_pid, stack
    :ok
  end
  
end

