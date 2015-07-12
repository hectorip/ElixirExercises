{date, time} = :calendar.local_time

{year, month, day} = date

{hour, minute, second} = time

IO.puts "Year #{year}"
IO.puts "Month #{month}"
IO.puts "day #{day}"
IO.puts "Hour #{hour}"
IO.puts "Minute #{minute}"
IO.puts "Second #{second}"


# Reading a file

{:ok, contents} = File.read("my_files.txt")

IO.puts contents

# Patterns

{_, time} = :calendar.local_time

IO.puts elem(time, 2)

IO.puts "Capturing values"
Enum.each(Tuple.to_list(time), &IO.puts/1)
IO.puts "Finishing."
{_,{hour,_,_}} = :calendar.local_time

IO.puts hour

# Elixir will only bind a variable one time per bind
[a, a] = [1, 1]
#t this will not pass
# [a, a] = [1, 2]

# this will not fail
a = 1
a = 2


# Variables bind once per match

# this will fail
# [a, b, a] = [1, 2, 3] 
# [a, b, a] = [1, 1, 2]
# this will pass
[a, b, a] = [1, 2, 1]

# Working with pin operator

a = 2
# This will fail, not because a is 2 but because it
# was rebound and the third element was not equal

# [a, b, a] = [1, 2, 3]
# [a, b, a] = [1, 1, 2]

a = 1 # No problem

# ^a = 2 
^a = 1
^a = 2 - a # This will pass
IO.puts a
