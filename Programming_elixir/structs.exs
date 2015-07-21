defmodule User do
  defstruct name: "", age: 18
end

user_1 = %User{}
IO.inspect user_1