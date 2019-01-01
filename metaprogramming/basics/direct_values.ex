# The following values are represented exactly in the same
# way both in high level code and in the AST

# integers
IO.inspect(quote do 5 end) # 5

# floats
IO.inspect(quote do 3.145 end) # 3.145


# Strings
IO.inspect(quote do "Elixir" end) # "Elixir"

# Atoms
# do blocks are parameters to the quote function
IO.inspect(quote(do: :atoooom)) # :atoooom

# Lists

IO.inspect(quote do [1, 2, 3] end) # [1, 2, 3]


# Two-tuples composed of former value types
IO.inspect(quote do {:ok, 7} end) # {:ok, 7}
IO.inspect(quote do {:ok, 7, 5} end) # This is not direct