defmodule Orchestrator do
  @name :orchestrator
  def generator()
  def start do
    pid = spawn(__MODULE__, :listener, [[]])
    :global.register_name(@name, pid)
  end
  def register(pid) do
    IO.puts "Requested Register"
    send :global.whereis_name(@name), { :register, pid }
  end
  def listener(ring) do
    receive do
      { :register, pid } ->
        if List.first ring do
          send (List.first ring), {:register, pid, (length ring) }
          send pid, {:register, (List.last ring),  (length ring) + 1 }
        else
          send pid, {:register, pid, 0}
          send pid, {:tick, 0}
        end
        IO.puts "Registering in ring"
        listener( [ pid | ring ] )
    end
  end
end
defmodule Client do
  def start do
    pid = spawn(__MODULE__, :get_up, [nil, 0])
    Orchestrator.register(pid)
  end

  def get_up(next, id) do
    receive do
      {:register, pid, assigned_id} ->
        get_up(pid, assigned_id)
      {:tick, pid} ->
        IO.puts "tick received from #{pid}"
        receive do
        after 2000 ->
          send next, {:tick, n}
          get_up(next,n)
        end
    end
  end
end
