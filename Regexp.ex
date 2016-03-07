# Regexp
# how to generate regexp's and running it

matches = Regex.run ~r{[aeiou]}, "Murcielago"

IO.puts matches

matches2 = Regex.scan ~r{[aeiou]}, "Murciegalo"

print_anon = fn(x) ->  y = "Using a sigil to concatenate this " <> ~s(#{x}) ; IO.puts y end
IO.puts "Starting with iterations"
Enum.each(
    matches2,
    print_anon
)

