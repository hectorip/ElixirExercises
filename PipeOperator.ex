567
|> abs
|> Integer.to_string
|> String.reverse
|> IO.puts

# Now I truly understand the pipeline operator.

(1..10)
|> Enum.filter(&(&1 > 5))
|> Enum.map &IO.puts/1