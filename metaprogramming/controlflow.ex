# 'quote' and 'unquote' are like string interpolation in AST
# 'unquote' is like delaying code execution
# 'quote' is requesting the internal representation of the code
# inside the do clause

defmodule ControlFlow do
  defmacro unless(expression, do: block) do
    quote do
      if !unquote(expression), do: unquote(block)
    end
  end
end


defmodule UsingUnless do
  require ControlFlow

  def doSomething do
    ControlFlow.unless(false) do
      IO.puts "works"
    end
  end
end
