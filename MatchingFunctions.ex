defmodule Rectangle do
  def area({a, b}) do
    a * b
  end
end

IO.puts Rectangle.area({5,4})
