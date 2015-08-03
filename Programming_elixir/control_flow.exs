defmodule ControlFlow do
  def fizz_buzz(up_to) do
    for x <- 1..up_to do
      case x do
        x when 0 == rem(x,15) -> "FizzBuzz"
        x when 0 == rem(x, 3) -> "Fizz"
        x when 0 == rem(x, 5) -> "Buzz"
        x -> x
      end
    end
  end
end
