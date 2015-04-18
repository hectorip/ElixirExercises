{date, time} = :calendar.local_time

{year, month, day} = date

{hour, minute, second} = time

IO.puts "Year #{year}"
IO.puts "Month #{month}"
IO.puts "day #{day}"
IO.puts "Hour #{hour}"
IO.puts "Minute #{minute}"
IO.puts "Second #{second}"
