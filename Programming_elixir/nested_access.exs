# The file structs must be compiled and loades in order to
# make this file works

import User
import Group

user_1 = %User{name: "Hector"}
group_1 = %Group{director: user_1, size: 1}


IO.puts group_1.director.name

# updating a struct 
user_1 = %User{ user_1 | name: "Iván"}
IO.puts user_1.name
IO.puts group_1.director.name

group_1 = %Grpup{ group_1 | director: %User{ user_1 | name: "Pedro"}}