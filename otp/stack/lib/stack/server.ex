defmodule Stack.Server do
  use GenServer
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :stack_server)
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
  def handle_call(:pop, _client, []) do
    {:reply, nil , []}
  end
  def handle_call(:pop, _client, [next|rest]) do
    {:reply, next, rest}
  end
  def handle_call(:push, _client , stack) do
    {:stop, "WE received push as call", stack}
    # raise "Received 10"
  end

  # This function is recommended to try several different ways of termnating the app
  def handle_cast({:push, n}, stack) when n < 10 do
    System.halt n
  end
  def handle_cast({:push, element_to_push}, stack) do
    {:noreply, [ element_to_push | stack ]}
  end
  def terminate(reason, state) do
    IO.puts "Terminating Message"
    IO.inspect reason
    IO.inspect state
    :ok
  end
end
