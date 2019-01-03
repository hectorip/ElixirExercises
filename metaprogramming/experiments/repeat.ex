defmodule Repeats do
    defmacro repeat(times, do: code) when is_integer(times) do
        quote do
            1..unquote(times)
            |> Enum.map(fn _ -> unquote(code) end)
        end
    end
end