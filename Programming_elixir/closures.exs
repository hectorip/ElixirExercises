
greet = fn name ->
  fn ->
    IO.puts "Hello #{name}"
  end
end

greet_hector = greet.("Hector")

greet_hector.()