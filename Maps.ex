# Maps

# This is the syntax for a map, collections of keyus and values
bob = %{:name => "Bob", :age => 25, :works_at => "Shoe Lovers"}


# When all keys are atoms you can use this shortcut
erik = %{name: "Erik", age: 25, works_at: "Matzinger"}


# And you can access it by as an object or with the square bracket
IO.puts bob.name
IO.puts bob[:age]


IO.puts erik[:name]
IO.puts erik[:non_existent_field]


# Adding elements to a Map
bob = %{bob | :age => 50000}

IO.puts bob.age

# Another Way
bob = Map.put(bob, :salary, 70000)

IO.puts bob.salary
