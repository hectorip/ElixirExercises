# Anonimous Functions

list_concat = fn list_1, list_2 ->
  list_1 ++ list_2
end

sum = fn (a, b, c) -> a + b + c end

pair_tuple_to_list = fn {a, b} -> [a, b] end