defmodule Controls do


  defmacro while(condition, code) do
    quote do
      for _ <- Stream.cycle([:ok]) do
        if unquote(condition) do
          unquote(code)
        end 
      end
    end
  end


end
