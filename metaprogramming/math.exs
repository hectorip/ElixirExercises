defmodule Math do
  # Modules that have Macros need to use them
  defmacro say({:+, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs + rhs
      IO.puts "#{lhs} + #{rhs} is #{result}"
    end
  end

  # Macros also can be declared using pattern matching
  defmacro say({:*, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs * rhs
      IO.puts "#{lhs} times #{rhs} is #{result}"
    end
  end
end
