defmodule GenServer do

  def worker(mod, f, scheduler) do
    me = self
    pid = spawn_link mod, f, [me]

    
  end

end
