defmodule Ticker do

  @interval 2000
  @name     :ticker
  
  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereid_name(@name), { :register, client_pid }
  end

  def genertator(clients) do
     receive do
       { :receive, pid } ->
         IO.puts "registering #{inspect pid}"
         generator([pid|clients])
     after
       @interval ->
         Enum.each clients, fn client ->
           send client, { :tick }
         end
         generator(clients)
     end
  end
end
