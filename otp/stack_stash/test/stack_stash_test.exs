defmodule StackStashTest do
  use ExUnit.Case
  doctest StackStash

  test "Stack works in the right order" do
    assert Stack.Server.pop == 1
    assert Stack.Server.pop == 6
    assert Stack.Server.pop == 199
    assert Stack.Server.pop == "fourth"
  end

  test "Stack push-pop works" do
    assert Stack.Server.push 100
    assert Stack.Server.pop == 100
  end

  test "Stack pop on empty" do
    assert Stack.Server.pop == nil
  end

  test "Stack does not stop working after failure" do
    Stack.Server.push 5
    Stack.Server.cause_error
    assert Stack.Server.pop == 5
  end
end
