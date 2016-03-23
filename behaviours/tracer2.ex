defmodule Tracer do
  defmacro def(definition, code) do
    quote do
      
    end
  end
end

defmodule Test do
  import Kernel, except: [def: 2]
  import Tracer, only:   [def: 2]

  def puts_sum_three(a, b, c), do: IO.inspect(a+b+c)
  def add_list(list),          do: Enum.reduce(list, 0, &(&1+&2))

end
