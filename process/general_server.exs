defmodule GeneralServer do

  def worker(scheduler, f,args) do
    send scheduler, {:ready, self}
    receive do
      {:call, f, args, client} ->
        send client, {:answer, args, f.(args)}
        worker(f, scheduler, args)
      {:shutdown} ->
        exit(:normal)
  end
end

defmodule GeneralScheduler do
  def run(num_processes, module, f, args) do
    (1..num_processes)
    |> Enum.map(fn (_) -> spawn(module, :worker, [self, f, args]))
  end
end
