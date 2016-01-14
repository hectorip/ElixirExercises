defmodule Stack.SubSupervisor do
  use Supervisor
  def start_link(stash_pid) do
    {ok, _pid} = Supervisor.start_child(__MODULE__, stash_pid)
  end
end
