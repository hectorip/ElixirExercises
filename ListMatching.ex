[head | tail] = [1, 2, 3]

IO.puts head

Enum.each(tail, &IO.puts/1)

[min | _] = Enum.sort([5,6,3,0])

IO.puts "Min: #{min}"
