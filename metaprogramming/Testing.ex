defmodule Assertion do
  # Expected Result:
  #
  # ..
  # FAILURE:
  # Expected 10
  # to be lees than: 1

  # asserting like in exunit
  defmacro extend(_options \\ []) do
    quote do
      import unquote(__MODULE__)

      def run do
        # stubed metod
        IO.puts "Trying to run test..."
      end
    end
  end

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute __MODULE__, :tests, accumulate: true
      IO.inspect unquote(__MODULE__) # just to get out of doubt

      def run do
        IO.puts "Running tests... (#{inspect @tests})"
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

  def assert(:==, lhs, rhs )  when lhs == rhs, do: IO.puts "."

  def assert(:==, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs}
      to be equal to: #{rhs}
    """
  end

  def assert(:>, lhs, rhs )  when lhs > rhs, do: IO.puts "."

  def assert(:>, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs}
      to be greater than: #{rhs}
    """
  end

  def assert(:>=, lhs, rhs )  when lhs >= rhs, do: IO.puts "."

  def assert(:>=, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs}
      to be greater than or equal to: #{rhs}
    """
  end

  def assert(:<, lhs, rhs )  when lhs < rhs, do: IO.puts "."

  def assert(:<, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs}
      to be lesser than: #{rhs}
    """
  end

  def assert(:<=, lhs, rhs )  when lhs <= rhs, do: IO.puts "."

  def assert(:<=, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs}
      to be lesser than or equal to: #{rhs}
    """
  end

end

defmodule MathTest do

  use Assertion

  # test "Integers can be added and substracted" do
  #
  #   assert 5 + 5 == 10
  #   assert 8 - 10 == -2
  #   assert 5 - 5 == 10
  #
  # end
  #
  # test "Integers can be multiplied an divided" do
  #
  #   assert 5 / 5 == 1
  #   assert 5 * 5 == 25
  #   assert 7 * 9 == 36
  #
  # end

end


# defmodule MathTest do
#   use Assertion
# end
