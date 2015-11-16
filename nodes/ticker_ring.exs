defmodule Client do
  @next nil
  @last nil
  @first nil
  def start do
    pid = spawn(__MODULE__, :get_up, [@first])
    if @first == nil
      @first = pid
    
    @last = pid
    register pid
  end
  
  def get_up(next) do
    receive do
      {:register, pid} ->
        get_up(pid)
      {:tick, pid} ->
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
