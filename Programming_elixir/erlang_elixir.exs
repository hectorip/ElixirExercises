IO.puts("Converting float to string")
f = 3.567
fs = :io_lib.format("~.2f", [f])
IO.puts fs
IO.puts("fs is a string")

IO.puts("\nOperarating system variable\n")
path = System.get_env("PATH")
IO.puts("PATH is #{path}")

IO.puts("\nExtension of a file\n")
ext = Path.extname("/dir/MyFile.txt")
IO.puts("\nExtension is: #{ext}\n")
