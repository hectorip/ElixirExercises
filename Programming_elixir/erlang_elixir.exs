IO.puts("Converting float to string")
f = 3.567
fs = :io_lib.format("~.2f", [f])
IO.puts fs
IO.puts("fs is a string")


