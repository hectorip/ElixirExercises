# Regexp

matches = Regex.run ~r{[aeiou]}, "Murcielago"

IO.puts matches

matches2 = Regex.scan ~r{[aeiou]}, "Murciegalo"

print_anon = fn(x) -> IO.puts(x) end
IO.puts "Stating with iterations"
Enum.each(
    matches2,
    print_anon
)


