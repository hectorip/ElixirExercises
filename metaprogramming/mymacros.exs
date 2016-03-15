

defmodule Macros do
  defmacro if(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    quote do
      case unquote(condition) do
        val when val in [false, nil] -> unquote(else_clause)
        _ -> unquote(do_caluse)
      end
    end
  end
  defmacro unless(condition, clauses) do
    do_caluse = Keyword.get(clauses, :do, nil)
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
  # Macros should be imported before using it always
  use Macros

  def test_if do
    Macros.if 1==2 do:
    
    else:

    end
  end

  def test_unless do
    
  end

end
