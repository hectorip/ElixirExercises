defmodule User do
  defstruct name: "", age: 18
end

defmodule Group do
  defstruct director: %{}, size: 0
end
# I learned Structs cannot be accesed in the same scope