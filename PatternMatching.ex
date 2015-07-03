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
