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

IO.puts("\nProcess Working Directory\n")
cwd = System.cwd()
IO.puts("Current Working directory is #{cwd}")

IO.puts("\nExecuting a command in the shell")
{cwd_s, _} = System.cmd("pwd",[])
IO.puts("Current Working directory got by shell is #{cwd_s}")
