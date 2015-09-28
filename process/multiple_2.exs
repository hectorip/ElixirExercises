defmodule Proc do
  def return_token do
    receive do
      {sender, token} ->
        send sender, token
    end
  end
end

pid_1 = spawn(Proc, :return_token, [])
pid_2 = spawn(Proc, :return_token, [])

send pid_1, {self, 'Luffy'}
send pid_2, {self, 'Zoro'}

receive do
  token -> IO.puts token
end

receive do
  token -> IO.puts token
end
