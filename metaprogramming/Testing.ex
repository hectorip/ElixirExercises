defmodule Assertion do

  # asserting like in exunit
  defmacro assert({operator, _context, [lhs, rhs]}) do
    quote bind_quoted: [lhs: lhs, rhs: rhs, operator: operator] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end

end

#
# defmodule Test do
#   require Assertion
#
#   def run do
#     assert 5 == 5
#     assert 2 > 0
#     assert 10 < 1
#   end
# end

defmodule Assertion.Test do
  def assert(:==, lhs, rhs )  when lhs == rhs, do: IO.puts "."
end

# Expected:
#
# ..
# FAILURE:
# Expected 10
# to be lees than: 1
