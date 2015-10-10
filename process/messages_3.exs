defmodule MessageQueue do
  def send_message(pid) do
    send pid, ":)"
    exit(:boom)
  end

  def receiveMessages() do
    receive do
      msg ->
        IO.puts msg
        receiveMessages()
    end
  end

  def run() do
    pid = spawn_link(MessageQueue, :send_message, [this])
    import :timer, only: [ sleep: 1 ]
    sleep 500
    receiveMessages()
  end
end

