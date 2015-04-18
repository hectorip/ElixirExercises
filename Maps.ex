# Maps

bob = %{:name => "Bob", :age => 25, :works_at => "Shoe Lovers"}


# When all keys are atoms

erik = %{name: "Erik", age: 25, works_at: "Matzinger"}

IO.puts bob.name
IO.puts bob[:age]

IO.puts erik[:name]
IO.puts erik[:non_existent_field]


# Adding elements to a Map

bob = %{bob | :age => 50000}

IO.puts bob.age

bob = Map.put(bob, :salary, 70000)

IO.puts bob.salary
