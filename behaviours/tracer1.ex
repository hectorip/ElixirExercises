defmodule Tracer do
  defmacro def(definition, do: _content) do
    IO.inspect definition
    quote do: {}
  end
end

