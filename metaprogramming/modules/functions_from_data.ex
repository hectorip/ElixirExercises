defmodule Say do
    for {text_number, int_number} <- [one: 1, two: 2, three: 3] do
        def unquote(text_number)() do
            unquote(int_number)
        end
    end
end