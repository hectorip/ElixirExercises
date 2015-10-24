defmodule GenServer do

  def worker(f, scheduler,args) do
    send scheduler, {:ready, self}
    receive do
      {:call, f, args, client} ->
        send client, {:answer, args, f.(args)}
        worker(f, scheduler, args)
      {:shutdown} ->
        exit(:normal)
  end
end


