defmodule GeneralServer do

  def worker(scheduler) do
    send scheduler, {:ready, self}
    #IO.puts "~n ready"
    #IO.inspect self
    receive do
      {:call, file, client} ->
        send client, {:answer, file, search_cat(file), self}
        worker(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp search_cat(file) do
    # Here we will search for cat
    content = File.read! file
    #IO.inspect content
    length(Regex.scan(~r/cat/iu,content))
  end
end

defmodule GeneralScheduler do
  def run(arg, n_process) do
    files = (File.ls! arg) |> Enum.map(&(arg <> "/" <> &1))
    n_processes = ((n_process > 0) && n_process) || length(files)
    (1..n_processes)
    |> Enum.map(fn (_) -> spawn(GeneralServer, :worker, [self]) end)
    |> schedule_processes(files, 0)
  end
  def run_timed(arg, n_process \\ 0) do
    {time, result} = :timer.tc(GeneralScheduler, :run, [arg, n_process])
    :io.format "~.2f~n", [time / 1000]
  end

  defp schedule_processes(processes, to_process,res) do
    receive do
      {:ready, pid } when length(to_process) > 0 ->
        [ next | tail ] = to_process
        send pid, {:call, next, self}
        schedule_processes(processes, tail, res)
      {:ready, pid } ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), to_process, res)
        else
          IO.inspect res
        end
      {:answer, file, result, _pid} ->
        res = res + result
        schedule_processes(processes, to_process, res)
    end
  end
end
