defmodule StackStash do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
       worker(Stack.Server, [[1, 4, 5]]),
    ]

    opts = [strategy: :one_for_one, name: StackStash.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
