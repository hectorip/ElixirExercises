defmodule Orchestrator do
  @name :orchestrator
  def generator()
  def start do
    pid = spawn(__MODULE__, :listener, [[]])
    :global.register_name(@name, pid)
  end
  def register(pid) do
    IO.puts "Requested Register for #{pid}"
    send :global.whereis_name(@name), { :register, pid }
  end
  def listener(ring) do
    receive do
      { :register, pid } ->
        if List.first do
          send List.first  ring, {:register, pid}
          send pid pid, {:register, List.last}
        end
        IO.puts "Registering in ring #{pid}"
        listner( [ pid | ring ] )
    end
  end
end
defmodule Client do
  def start do
    pid = spawn(__MODULE__, :get_up, [])
    Orchestrator.resgister(pid)
  end
  
  def get_up(next) do
    receive do
      {:register, pid} ->
        get_up(pid)
      {:tick, pid} ->
        IO.puts "tick received from: #{pid}"
        receive do
        after 2000 ->
          send next, {:tick, self}
        end
    end
  end
  def register(client_pid) do
    IO.puts "Registering #{client_pid}"
    send @last, { :register, client_pid}
  end
end
