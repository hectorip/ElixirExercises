person = {"name", 42}

age = elem(person, 1)

#IO.puts person
IO.puts age

person = put_elem(person, 1, 43)

# IO.puts person
age = elem(person, 1)
IO.puts age
