# fizz Buzz

fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

IO.puts fizz_buzz.(0,0,2)
IO.puts fizz_buzz.(0,1,2)
IO.puts fizz_buzz.(1,0,2)
IO.puts fizz_buzz.(1,1,100)