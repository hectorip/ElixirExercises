defmodule Test do
  use Tracer
  def puts_sum_three(a,b,c), do: IO.inspect(a + b + c)
  def add_list(list),        do: Enum.reduce(list, 0, &(&1+&2))
end
