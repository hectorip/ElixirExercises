defmodule ControlFlow do
  def fizz_buzz(up_to) do
    for x <- 1..up_to do
      case x do
        number = x when 0 == rem(number,15) -> "FizzBuzz"
      end
    end
  end
end
