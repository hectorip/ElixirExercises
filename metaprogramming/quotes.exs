# The quoting of primitives will return the primitives themselves

quote do: :atom

quote do: 123

quote do: 3.14

quote do: [1, 3, 4]

quote do: "String"

quote do: {:ok, 1}

quote do: {:ok, [1, 2, 3]}

quote do: 5 + 2 - 1 + 7
# this will not ve primitives

quote do: %{a: 1, b: 2}
quote do: Enum

quote do: {1, 2, 3, 4}
