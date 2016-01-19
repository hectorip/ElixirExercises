defmodule StackStashTest do
  use ExUnit.Case
  doctest StackStash

  test "Stack works in the right order" do
    assert Stack.Server.pop == 1
    assert Stack.Server.pop == 6
    assert Stack.Server.pop == 199
    assert Stack.Server.pop == "fourth"
  end
end
