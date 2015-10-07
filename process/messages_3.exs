defmodule MessageQueue do
  def send_message(pid) do
    send pid, ":)"
  end
end


pid = spawn_link(MessageQueue, :send_message, [])
