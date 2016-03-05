# 'quote' and 'unquote' are like string interpolation in AST

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
    unless(false) do
      IO.puts "works"
    end
  end

end
