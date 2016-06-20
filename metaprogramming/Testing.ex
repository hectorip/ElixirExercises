defmodule Testing do

  # asserting like in exunit
  defmacro assert([operator, [], arguments]) do

  end

end


defmodule Test do
  require Testing

  def run do
    assert 5 == 5
    assert 2 > 0
    assert 10 < 1
  end
end


# Expected:
#
# ..
# FAILURE:
# Expected 10
# to be lees than: 1
