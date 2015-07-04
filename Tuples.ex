person = {"name", 42}

age = elem(person, 1)

#IO.puts person
IO.puts age

person_2 = put_elem(person, 1, 43)

# IO.puts person
age = elem(person_2, 1)
IO.puts age


# Destructuration

{a, b, c, d} = {"a", "b", "c", "d"}

IO.puts a
IO.puts b
IO.puts c
IO.puts d
