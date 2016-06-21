defmodule Assertion do

  # asserting like in exunit
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

# Expected:
#
# ..
# FAILURE:
# Expected 10
# to be lees than: 1
