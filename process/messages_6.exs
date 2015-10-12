defmodule MessageQueue do
  def send_message(pid) do
    send pid, ":)"
    exit(:boom)
  end
  def send_message_exception(pid) do
    send pid, ":("
    raise "oooops"
  end

  def receiveMessages() do
    receive do
      msg ->
        IO.inspect msg
        receiveMessages()
    end
  end

  def run(:exception) do
    Process.flag(:trap_exit, true)
    spawn_monitor(MessageQueue, :send_message_exception, [self])
    import :timer, only: [ sleep: 1 ]
    sleep 500
    receiveMessages()
  end
  def run() do
    Process.flag(:trap_exit, true)
    spawn_monitor(MessageQueue, :send_message, [self])
    import :timer, only: [ sleep: 1 ]
    sleep 500
    receiveMessages()
end

