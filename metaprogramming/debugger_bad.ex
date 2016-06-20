defmodule Debugger do
  defmacro log(expression) do
    if System.get_env(:debug, :log_level) == :debug do
      quote do
        IO.puts "***********************************"
        IO.inpect unquote(expression)
        IO.puts "***********************************"
        unquote(expression)
      end
    else
      expression
    end
  end
end
