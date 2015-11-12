defmodule Ticker do

  @interval 2000
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], 0])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    IO.puts "requested"
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients, to) do
     receive do
       { :register, pid } ->
         IO.puts "registering #{inspect pid}"
         generator([pid|clients], to)
     after  # This will reset when this server receives a register request
       @interval ->
         IO.puts "tick"
        
         to = (length(clients) <= to) && 0 ||  to
         c = Enum.at clients, to, :nil
         if c do
          send c, { :tick }
         else
           to = -1
         end
         generator(clients, to + 1)
     end
  end
end

defmodule Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver() do
    receive do
      { :tick } ->
        IO.puts "tick received"
        receiver
    end
  end
end
