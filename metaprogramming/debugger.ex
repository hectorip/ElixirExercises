defmodule Debugger do
  # bind_quoted prevents evaluating the code two times
  defmacro log(expression) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote bind_quoted: [expression: expression] do
        IO.puts("***********************************")
        IO.inspect(expression) # 1
        IO.puts("***********************************")
        expression # 2
      end
    else
      expression # 3 times
    end
  end
end
