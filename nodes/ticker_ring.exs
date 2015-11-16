defmodule Client do
  def start do
    pid = spawn(__MODULE__, :ticker, [])
    register pid
  end

end
