defmodule ControlFlow do
  def FizzBuzz(up_to) do
    for x <- 1..up_to do
      case x do
        0 = rem(x,15) -> "FizzBuzz"
      end
    end
  end
end
