defmodule MessageQueue do
  def send_message(pid) do
    send pid, ":)"
    exit(:boom)
  end

  def run() do
    pid = spawn_link(MessageQueue, :send_message, [])
    import :timer, only: [ sleep: 1 ]
    sleep 500
    receive do
      msg -> 
       IO.puts msg
    end
  end
end

