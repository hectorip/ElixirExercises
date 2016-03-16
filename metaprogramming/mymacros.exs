

defmodule Macros do
  defmacro if(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    quote do
      case unquote(condition) do
        val when val in [false, nil] -> unquote(else_clause)
        _ -> unquote(do_clause)
      end
    end
  end
  defmacro unless(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    quote do
      case unquote(condition) do
        val when val in [false, nil] -> unquote(do_clause)
        _ ->unquote(else_clause)
      end
    end
  end

end

defmodule Test do
  # Macros should be imported before using it, always
  require Macros

  def test_if do
    Macros.if 1==2 do
      IO.puts "1==2"
    else
      IO.puts "1 != 2"
    end
  end

  def test_unless do
    Macros.unless false do
      IO.puts "Unless is working!"
    else
      IO.puts "If this is printed, unless does not work"
    end
  end

end
