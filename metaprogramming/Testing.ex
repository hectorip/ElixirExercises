# Exercise of creating a mini testing framework from Metaprogramming Elixir

defmodule Assertion do
  defmacro extend(_options \\ []) do
    quote do
      import unquote(__MODULE__)

      def run do
        # stubed metod
        IO.puts("Trying to run test...")
      end
    end
  end

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :tests, accumulate: true)
      # just to get out of doubt
      IO.inspect(unquote(__MODULE__))
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        IO.puts("Running tests... (#{inspect(@tests)})")
        Assertion.Test.run(@tests, __MODULE__)
      end
    end
  end

  defmacro test(description, do: test_block) do
    test_function = String.to_atom(description)

    quote do
      @tests {unquote(test_function), unquote(description)}
      def unquote(test_function)(), do: unquote(test_block)
    end
  end

  defmacro refute({operator, _context, [lhs, rhs]}) do
    operator_map = %{
      ==: :!==,
      !==: :==,
      <: :>=,
      >: :<=,
      <=: :>,
      >=: :<
    }

    IO.inspect(lhs)
    IO.inspect(rhs)
    IO.inspect(operator)
    negated_operator = Dict.get(operator_map, operator)
    IO.inspect(negated_operator)

    quote bind_quoted: [lhs: lhs, rhs: rhs, operator: negated_operator] do
      IO.inspect(operator)
      IO.puts("REFUTTEEEE")
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end

  defmacro assert({true, _context, []}) do
    quote do
      IO.write(".")
    end
  end

  defmacro assert({false, _context, []}) do
    quote do
      IO.puts("""
        Expected: true
      """)
    end
  end

  defmacro assert({operator, _context, [lhs, rhs]}) do
    quote bind_quoted: [lhs: lhs, rhs: rhs, operator: operator] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end
end

#
defmodule Test do
  import Assertion

  def run do
    assert 5 == 5
    assert 2 > 0
    assert 2 < 0
    assert 10 > 1
    assert 10 <= 1
  end
end

defmodule Assertion.Test do
  def run(tests, module) do
    Enum.each(tests, fn {test_func, description} ->
      case apply(module, test_func, []) do
        # Does not append a new line after the content
        :ok ->
          IO.puts(".")

        {:fail, reason} ->
          IO.puts("""
          ==================================================
          FAILURE: #{description}
          ==================================================
          #{reason}
          """)
      end
    end)
  end

  def run_parallel(tests, module) do
    Enum.each(tests, fn {test_func, description} ->
      case apply(module, test_func, []) do
        # Does not append a new line after the content
        :ok ->
          IO.write(".")

        {:faiil, reason} ->
          IO.puts("""

          ==================================================
          FAILURE: #{description}
          ==================================================
          #{reason}
          """)
      end
    end)
  end

  def assert(:==, lhs, rhs) when lhs == rhs, do: :ok

  def assert(:==, lhs, rhs) do
    {:fail,
     """
       Expected: #{lhs}
       to be equal to: #{rhs}
     """}
  end

  def assert(:>, lhs, rhs) when lhs > rhs, do: :ok

  def assert(:>, lhs, rhs) do
    {:fail,
     """
       Expected: #{lhs}
       to be greater than: #{rhs}
     """}
  end

  def assert(:>=, lhs, rhs) when lhs >= rhs, do: :ok

  def assert(:>=, lhs, rhs) do
    {:fail,
     """
       Expected: #{lhs}
       to be greater than or equal to: #{rhs}
     """}
  end

  def assert(:<, lhs, rhs) when lhs < rhs, do: :ok

  def assert(:<, lhs, rhs) do
    {:fail,
     """
       Expected: #{lhs}
       to be lesser than: #{rhs}
     """}
  end

  def assert(:<=, lhs, rhs) when lhs <= rhs, do: :ok

  def assert(:<=, lhs, rhs) do
    {:fail,
     """
       Expected: #{lhs}
       to be lesser than or equal to: #{rhs}
     """}
  end

  def assert(:!==, lhs, rhs) when lhs !== rhs, do: :ok

  def assert(:!==, lhs, rhs) do
    {:fail,
     """
       Expected: #{lhs}
       to be different from: #{rhs}
     """}
  end
end

defmodule MathTest do
  use Assertion

  test "Integers can be added and substracted" do
    assert 5 + 5 == 10
    assert 8 - 10 == -2
    assert 5 - 5 == 10
  end

  test "Integers can be multiplied an divided" do
    assert 5 / 5 == 1
    assert 5 * 5 == 25
    assert 7 * 9 == 36
  end

  test "Refuting some operations" do
    refute 5 !== 5
  end
end
