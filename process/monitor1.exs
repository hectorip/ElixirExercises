defmodule Monitor1 do
  import :timer, only: [sleep: 1]
  
  def sad_method do
    sleep 500
    exit(:boom)
  end

  def run do
    "test"
  end
end
