def Stack.Supervisor do
  use Supervisor

  def start_link(initial_stack) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_stack])
  end
end
