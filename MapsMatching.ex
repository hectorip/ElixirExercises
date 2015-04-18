%{age: age} = %{name: "Bob", age: 35}

IO.puts age


# Compund Mathces

date_time =  {_, {hour, _, _ }} = :calendar.local_time

IO.puts "Hour : #{hour}"
