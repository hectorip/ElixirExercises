defmodule Controls do


  defmacro while(condition, code) do
    quote do
      try do
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

  defmacro break do
    quote do
      throw :break
    end
  end


end
