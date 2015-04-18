# Strings, Elixir doesn't have strings as a primitive type

an_string = "This is an String"

embedded_expression = "Pi value is #{3 + 0.141592 }"

IO.puts an_string
IO.puts embedded_expression


# Concatenating Strings

concat = "My String " <> " was built by " <> "concatenation"

IO.puts concat

multi_line = "
    This is 
    a 
    multi
    line
    string
"

#Sigils

sigil_built_string = ~s(Sigil built string, "escaped")

IO.puts sigil_built_string
not_interpolated = ~S(Not interpolated value #{something})

IO.puts not_interpolated
