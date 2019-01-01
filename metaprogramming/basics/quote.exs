IO.puts("Quoting code")
simple = quote do
    5 + 2
end
IO.inspect(simple)


IO.puts("Quoting several operations")
composed = quote do
    5 + 2 * 8
end
IO.inspect(composed)


IO.puts("Quoting module and function declaration")
declaration = quote do
    defmodule TestModule do
        def test_function do
            "hello"
        end
    end
end
IO.inspect(declaration)