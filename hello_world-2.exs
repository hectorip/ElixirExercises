defmodule Hello do
  # Named functions can only exist inside modules.
  def world do
        IO.puts "Hello World"
    end
end

# Note that functions can be used without parentheses
Hello.world
