defmodule Orchestrator do
  @name :orchestrator
  def generator()
  def start do
    pid = spawn(__MODULE__, :listener, [[]])
  end
  def listener do
    nil
  end
end
defmodule Client do
  def start do
    pid = spawn(__MODULE__, :get_up, [@first])
    if @first == nil do
      @first = pid
    end
    @last = pid
    register pid
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
