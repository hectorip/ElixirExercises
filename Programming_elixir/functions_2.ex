# fizz Buzz

get_word = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end
IO.puts("Testing first function")
IO.puts get_word.(0,0,2)
IO.puts get_word.(0,1,2)
IO.puts get_word.(1,0,2)
IO.puts get_word.(1,1,100)

IO.puts("\nTesting FizzBuzz")

fizz_buzz = fn number ->
  get_word.(rem(number, 3), rem(number, 5), number)
end

IO.puts fizz_buzz.(10)
IO.puts fizz_buzz.(11)
IO.puts fizz_buzz.(12)
IO.puts fizz_buzz.(13)
IO.puts fizz_buzz.(14)
IO.puts fizz_buzz.(15)
IO.puts fizz_buzz.(16)
IO.puts fizz_buzz.(17)
