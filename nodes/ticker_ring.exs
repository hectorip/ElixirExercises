
defmodule Orchestrator do

  @name :orchestrator

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
          send (List.first ring), { :register, pid, (length ring) }
          send pid, { :register, (List.last ring),  (length ring) + 1 }
        else
          send pid, { :register, pid, 1 }
          send pid, { :tick, 0 }
        end
        IO.puts "Registering in ring"
        listener([ pid | ring ])
    end
  end
end

defmodule Ticker do
  def start do
    pid = spawn(__MODULE__, :get_up, [nil, 0])
    Orchestrator.register(pid)
  end

  def get_up(next, id) do
    receive do
      { :register, pid, assigned_id } ->

        get_up(pid, assigned_id)

      { :tick, id } ->

        IO.puts "Tick received from #{id}"

        receive do
        after 2000 ->
          send next, {:tick, id}
          get_up(next, id)
        end
    end
  end
end
