IO.puts("Quote")
simple = quote do
    5 + 2
end
IO.puts inspect(simple)

composed = quote do
    5 + 2 * 8
end
IO.inspect(composed)