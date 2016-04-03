defmodule Controls do


  defmacro while(condition, do: code) do
    IO.inspect code
    quote do
      try do
        # This list comprehension will not allow modify external
        # variables, we should find another solution.
        # so, we cannot use something like i > 10 as the
        # ermination condition modifying i inside. But anyways,
        # that is no functional style
        for _ <- Stream.cycle([:ok]) do
          if unquote(condition) do
            unquote(code)
          else
            throw :break
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  def break, do: throw :break
  end

end
