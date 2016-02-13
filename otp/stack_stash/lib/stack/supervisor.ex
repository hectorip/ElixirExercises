defmodule Stack.Supervisor do
  use Supervisor

  def start_link(initial_stack) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_stack])
    start_workers(initial_stack, sup)
    result
  end

  def start_workers(initial_stack, supervisor) do
    {:ok, stash} = Supervisor.start_child(supervisor, worker(Stack.Stash, [initial_stack]))
    Supervisor.start_child(supervisor, worker(Stack.Server, [stash]))
  end
  
  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
